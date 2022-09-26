import 'package:json_annotation/json_annotation.dart';
import 'component_api_config.dart';

@JsonSerializable()
class ComponentConfig {
  @JsonKey(readValue: readSelf)
  final Map<String, dynamic> rawConfig;
  @JsonKey(name: 'vars')
  final ComponentApiConfig? apiConfig;

  ComponentConfig({required this.rawConfig, this.apiConfig});

  // This is used to get the root-level config json
  static Object? readSelf(Map<dynamic, dynamic> json, String key) {
    return json;
  }

}