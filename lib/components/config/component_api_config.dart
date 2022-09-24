import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/utils/api_route.dart';

part 'component_api_config.g.dart';

@JsonSerializable()
@ComponentApiConfigConverter()
class ComponentApiConfig {
  final API_ROUTE apiVersion;
  final String? endpoint;
  final Map<String, dynamic>? tags;
  final Map<String, dynamic>? contentType;
  final int? slug;

  ComponentApiConfig(this.apiVersion,
      {this.endpoint, this.tags, this.contentType, this.slug});

  factory ComponentApiConfig.fromJson(Map<String, dynamic> json) =>
      _$ComponentApiConfigFromJson(json);
}

class ComponentApiConfigConverter
    extends JsonConverter<ComponentApiConfig, Map<String, dynamic>> {
  const ComponentApiConfigConverter();

  @override
  ComponentApiConfig fromJson(Map<String, dynamic> json) {
    return ComponentApiConfig(
      API_ROUTE.v2,
      tags: json['required_tags'],
      contentType: json['buckets'],
      slug: json['slug'],
    );
  }

  @override
  Map<String, dynamic> toJson(ComponentApiConfig object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
