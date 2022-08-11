import 'dart:convert';

import 'package:juno_flutter/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:juno_flutter/api/models/user.dart';
import 'package:juno_flutter/utils/network.dart';

import '../utils/request_type.dart';

class LegacyAPI with Network implements API {
  static final LegacyAPI _legacyAPI = LegacyAPI._internal();

  factory LegacyAPI() {
    return _legacyAPI;
  }

  LegacyAPI._internal();

  @override
  Future<void> getSite(Uri magicLink) async {
    var host = magicLink.pathSegments[1];
    var token = magicLink.pathSegments[2];

    var user = User.fromJsonLegacy(
        jsonDecode((await tokenLogin(magicLink)).body)['user']);

    var result = await fetch(REQUEST_TYPE.post,
        Uri.parse('https://$host/custom_api/api_Services_SMC.php'), {
      'api': 'site_management_console',
      'user_id': user.userId,
      'token': token,
      'app': '1'
    });

    parseConfig(jsonDecode(result.body) as Map<String, dynamic>);
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
  void queryContent() {
    // TODO: implement queryContent
  }

  @override
  void getNavigation() {
    //  TODO: implement getNavigation
  }

  void parseConfig(dynamic json) {
    json['config'].forEach((k, v) => print("Key : $k, Value : $v"));
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
      Uri.parse('https://$host/crowdhub_api_v2/api_user_login_by_token.php'),
      body,
    );
    return result;
  }
}
