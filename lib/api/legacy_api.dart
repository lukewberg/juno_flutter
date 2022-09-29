import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:juno_flutter/api/api.dart';
import 'package:juno_flutter/api/models/app_config.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/api/models/user.dart';
import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';
import 'package:juno_flutter/router/navigation.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/api_route_extension.dart';
import 'package:juno_flutter/utils/network.dart';
import 'package:juno_flutter/utils/request_type.dart';

class LegacyAPI with Network implements API {
  static final LegacyAPI _legacyAPI = LegacyAPI._internal();
  late String _siteUrl;

  factory LegacyAPI() {
    return _legacyAPI;
  }

  LegacyAPI._internal();

  @override
  Future<AuthResult> authenticate(Uri magicLink) async {
    var host = magicLink.pathSegments[1];
    var token = magicLink.pathSegments[2];

    var user = User.fromJsonLegacy(
        jsonDecode((await tokenLogin(magicLink)).body)['user']);

    var result = await fetch(
        REQUEST_TYPE.post,
        Uri.parse(
            'https://$host/${API_ROUTE.custom.path}/api_Services_SMC.php'),
        {
          'api': 'site_management_console',
          'user_id': user.userId,
          'token': token,
          'app': '1'
        });

    var smcPayload = jsonDecode(result.body);
    var baseConfig =
        jsonDecode(smcPayload['config']['base_config'][0]['config_config']);
    var config = jsonDecode(smcPayload['config']['config_config']);

    var appConfig = parseConfig(baseConfig);
    var navigation = parseNav(config['NAVIGATION']);
    var authResult = AuthResult(appConfig, navigation);
    return authResult;
  }

  @override
  void getContent() {
    // TODO: implement getContent
  }

  @override
  void getRoutes() {
    // TODO: implement getRoutes
  }

  @override
  void getSession() {
    // TODO: implement getSession
  }

  @override
  Future<List<Content>> queryContent(
      REQUEST_TYPE type,
      List<BUCKETS>? buckets,
      API_ROUTE apiVersion,
      List<int>? requiredTags,
      String? slug,
      int? limit) async {
    buckets ??= [];
    requiredTags ??= [];
    var endpoint = Uri.parse(
        '$_siteUrl/${apiVersion.path}/api_content_oneAndOnlyList.php');
    var body = {
      for (var i = 0; i < buckets.length; i++) 'buckets[$i]': buckets[i].name,
      for (var i = 0; i < requiredTags.length; i++) 'tag[$i]': requiredTags[i],
      'per_page': limit.toString(),
      'app': '1'
    };
    var content = await fetch(type, endpoint, body);
    var contentList = jsonDecode(content.body)['content'] as List;
    return contentList.map((e) => Content.fromJsonLegacy(e)).toList();
  }

  @override
  void getNavigation() {
    //  TODO: implement getNavigation
  }

  @override
  AppConfig parseConfig(Map<String, dynamic> config) {
    return AppConfig.fromJsonLegacy(config);
  }

  Navigation parseNav(List<dynamic> rawNav) {
    List<NavItem> navItems = [];
    List<ComponentSeed> components = [];

    for (var nav in rawNav) {
      components.clear();
      if (nav['data'] is Map && nav['data']['elements'] is List<dynamic>) {
        nav['data']['elements'].forEach((rawComponent) {
          ComponentSeed component;
          switch (rawComponent['type']) {
            case 'featured_rotator':
              component =
                  ComponentSeed(COMPONENT_INDEX.carousel, rawComponent['data']);
              break;
            case 'grid':
              component =
                  ComponentSeed(COMPONENT_INDEX.grid, rawComponent['data']);
              break;
            default:
              component =
                  ComponentSeed(COMPONENT_INDEX.carousel, rawComponent['data']);
          }
          components.add(component);
        });
      }
      switch (nav['as']) {
        case 'navigate.live.home':
          navItems.add(NavItem(
              nav['name'], APP_PAGE.home.path, APP_PAGE.home, [...components]));
          break;
        case 'navigate.default.slug':
          navItems.add(NavItem(nav['name'], APP_PAGE.content.path,
              APP_PAGE.content, [...components]));
          break;
        default:
          break;
      }
    }
    return Navigation(routes: navItems);
  }

  @override
  Future<http.Response> tokenLogin(Uri magicLink) {
    var host = magicLink.pathSegments[1];
    var token = magicLink.pathSegments[2];
    var reroute = magicLink.queryParameters['token_reroute'];

    _siteUrl = 'https://$host';

    var body = {
      'token': token,
      'magic_link_reroute': reroute ?? '/main',
      'magic_link_domain': host,
      'app': '1',
    };

    var result = fetch(
      REQUEST_TYPE.post,
      Uri.parse('$_siteUrl/${API_ROUTE.v2.path}/api_user_login_by_token.php'),
      body,
    );
    return result;
  }
}
