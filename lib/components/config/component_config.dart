import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/utils/content_builder.dart';
import 'component_api_config.dart';

@JsonSerializable()
class ComponentConfig<T> {
  @JsonKey(readValue: readSelf)
  final Map<String, dynamic> rawConfig;
  @JsonKey(name: 'vars')
  final ComponentApiConfig? apiConfig;
  @JsonKey(ignore: true)
  Future<List<Content>> futureContentList = Future.value([]);
  @JsonKey(ignore: true)
  List<Content> contentList = [];

  ComponentConfig({required this.rawConfig, this.apiConfig}) {
    if (apiConfig != null) {
      futureContentList = ContentBuilder.getContentList(apiConfig!);
    }
  }

  // This is used to get the root-level config json
  static Object? readSelf(Map<dynamic, dynamic> json, String key) {
    return json;
  }

}