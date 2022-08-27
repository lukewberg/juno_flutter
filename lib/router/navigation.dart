import 'package:juno_flutter/components/component_index.dart';
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

abstract class ComponentConfig<T> {
  final Map<String, dynamic> rawConfig;

  ComponentConfig(this.rawConfig);
}

class ComponentApiConfig {
  final String endpoint;
  final API_ROUTE apiVersion;
  final Map<String, dynamic>? tags;
  final Map<String, dynamic>? contentType;
  final int? id;

  ComponentApiConfig(this.endpoint, this.apiVersion,
      {this.tags, this.contentType, this.id});
}
