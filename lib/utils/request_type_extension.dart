import 'request_type.dart';

extension RequestTypeExtension on REQUEST_TYPE{
  String get path {
    switch (this) {
      case REQUEST_TYPE.get:
        return '';
      case REQUEST_TYPE.post:
        return '';
    }
  }
}