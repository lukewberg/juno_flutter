import 'dart:convert';

import 'package:juno_flutter/api/api.dart';
import 'package:http/http.dart' as http;
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

  factory LegacyAPI() {
    return _legacyAPI;
  }

  LegacyAPI._internal();

  @override
  Future<Navigation> authenticate(Uri magicLink) async {
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
    var config = jsonDecode(smcPayload['config']['config_config']);
    return parseNav(config['NAVIGATION']);
    // parseNav(config['NAVIGATION']);
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
      BUCKETS? bucket,
      API_ROUTE apiVersion,
      Map<String, dynamic> tags,
      String slug,
      int limit) async {
    var endpoint = '${apiVersion.path}/api_content_oneAndOnlyList.php';
    var body = {
      'buckets': bucket?.name ?? '',
      'required_tags': jsonEncode(tags),
      'per_page': limit.toString(),
      'app': '1'
    };
    var content =
        await fetch(type, endpoint, body) as List<Map<String, dynamic>>;

    var result = content.map((element) {
      return Content.fromJsonLegacy(element);
    });

    return result;
  }

  @override
  void getNavigation() {
    //  TODO: implement getNavigation
  }

  void parseConfig(Map<String, dynamic> config) {}

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

    var body = {
      'token': token,
      'magic_link_reroute': reroute ?? '/main',
      'magic_link_domain': host,
      'app': '1',
    };

    var result = fetch(
      REQUEST_TYPE.post,
      Uri.parse(
          'https://$host/${API_ROUTE.v2.path}/api_user_login_by_token.php'),
      body,
    );
    return result;
  }
}
