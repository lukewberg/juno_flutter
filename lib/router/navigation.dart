import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/utils/api_route.dart';

import 'app_page.dart';

class Navigation {
  final List<NavItem>? routes;

  Navigation({this.routes});
}

class NavItem {
  final String? name;
  final String route;
  final APP_PAGE type;
  final List<NavItem>? subRoutes;
  final List<ComponentSeed> components;

  NavItem(this.name, this.route, this.type, this.components, {this.subRoutes});
}

class ComponentSeed {
  final COMPONENT_INDEX type;
  final Map<String, dynamic> rawConfig;

  ComponentSeed(this.type, this.rawConfig);
}

class ComponentConfig<T> {
  final Map<String, dynamic> rawConfig;
  final ComponentApiConfig? apiConfig;

  ComponentConfig({required this.rawConfig, this.apiConfig});
}

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
