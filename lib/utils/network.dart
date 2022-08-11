import 'package:http/http.dart' as http;
import 'package:juno_flutter/utils/request_type.dart';

//  Use as a mixin
class Network {

  Future<http.Response> fetch(REQUEST_TYPE type, endpoint, Map<String, String> body) {
    switch (type) {
      case REQUEST_TYPE.post:
        return http.post(endpoint, body: body);
      case REQUEST_TYPE.get:
        return http.get(endpoint);
    }
  }
}