import 'package:juno_flutter/components/component_index.dart';

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

class ComponentConfig {
  final Map<String, dynamic> rawConfig;
  ComponentConfig(this.rawConfig);
}
