import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/request_type.dart';

abstract class API {

  void authenticate(Uri magicLink);

  void getRoutes();

  void getContent();

  void getSession();

  void queryContent(REQUEST_TYPE type,  BUCKETS bucket, API_ROUTE apiVersion,
      Map<String, dynamic> tags, String slug, int limit);

  void tokenLogin(Uri magicLink);

  void getNavigation();
}