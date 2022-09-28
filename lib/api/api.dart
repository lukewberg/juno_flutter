import 'package:juno_flutter/api/models/app_config.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/router/navigation.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/request_type.dart';

abstract class API {

  void authenticate(Uri magicLink);

  void getRoutes();

  void getContent();

  void getSession();

  AppConfig parseConfig(Map<String, dynamic> config);

  void queryContent(REQUEST_TYPE type,  List<BUCKETS>? buckets, API_ROUTE apiVersion,
      List<int>? tags, String? slug, int? limit);

  void tokenLogin(Uri magicLink);

  void getNavigation();
}

class AuthResult {
  AppConfig config;
  Navigation navigation;

  AuthResult(this.config, this.navigation);
}