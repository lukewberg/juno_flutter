import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/router/navigation.dart';
import 'package:juno_flutter/utils/api_route.dart';

import 'app_page.dart';

class Navigation {
  final List<NavItem> routes;

  Navigation(this.routes);
}

class NavItem {
  final String? name;
  final String route;
  final APP_PAGE type;
  final List<NavItem>? subRoutes;
  final List<ComponentSeed> components;

  NavItem(
    this.name,
    this.route,
    this.type,
    this.components,
  {
    this.subRoutes
  }
  );
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

class ComponentApiConfig {
  final String endpoint;
  final API_ROUTE apiVersion;
  final Map<String, dynamic>? tags;
  final Map<String, dynamic>? buckets;
  final Map<String, dynamic>? contentType;
  final int? id;

  ComponentApiConfig(this.endpoint, this.apiVersion,
      {this.tags, this.buckets, this.contentType, this.id});
}

class ComponentApiConfigConverter extends JsonConverter<ComponentApiConfig, Map<String, dynamic>> {
  @override
  ComponentApiConfig fromJson(Map<String, dynamic> json) {
    return ComponentApiConfig(
      json['endpoint'],
      API_ROUTE.values.firstWhere((e) => e.toString() == json['apiVersion']),
      tags: json['tags'],
      contentType: json['contentType'],
      id: json['id'],
    );
  }

  @override
  Map<String, dynamic> toJson(ComponentApiConfig object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
