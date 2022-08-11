import 'package:juno_flutter/utils/api_route.dart';

extension ApiRouteExtension on API_ROUTE {
  String get path {
    switch (this) {
      case API_ROUTE.custom:
        return 'custom_api';
      case API_ROUTE.v2:
        return 'crowdhub_api_v2';
    }
  }
}