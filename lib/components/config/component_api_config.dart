import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/utils/api_route.dart';

part 'component_api_config.g.dart';

@JsonSerializable()
@ComponentApiConfigConverter()
class ComponentApiConfig {
  @JsonKey(defaultValue: API_ROUTE.v2)
  final API_ROUTE apiVersion;
  final String? endpoint;
  final List<int>? requiredTags;
  @JsonKey(name: 'not_tag_id')
  final List<int>? excludedTags;
  @JsonKey(name: 'buckets', readValue: _readBuckets)
  final List<String> contentType;
  final String? slug;
  @JsonKey(name: 'per_page')
  final int? limit;

  ComponentApiConfig(this.apiVersion,
      {this.endpoint,
      this.requiredTags,
      this.excludedTags,
      required this.contentType,
      this.slug,
      this.limit});

  factory ComponentApiConfig.fromJson(Map<String, dynamic> json) =>
      _$ComponentApiConfigFromJson(json);

  static Object? _readBuckets(Map<dynamic, dynamic> json, String key) {
    if (json.containsKey(key) && json[key] is List) {
      final List<dynamic> buckets = json[key];
      return buckets.map((e) => e.toString()).toList();
    } else if (json.containsKey(key) && json[key] is String) {
      return [json[key]];
    } else {
      return [];
    }
  }
}

class ComponentApiConfigConverter
    extends JsonConverter<ComponentApiConfig, Map<String, dynamic>> {
  const ComponentApiConfigConverter();

  @override
  ComponentApiConfig fromJson(Map<String, dynamic> json) {
    return ComponentApiConfig(
      API_ROUTE.v2,
      requiredTags: json['required_tags'],
      excludedTags: json['not_tag_id'],
      contentType: json['buckets'],
      slug: json['slug'],
      limit: json['per_page'],
    );
  }

  @override
  Map<String, dynamic> toJson(ComponentApiConfig object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
