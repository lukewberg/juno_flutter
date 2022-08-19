import 'package:juno_flutter/components/component_index.dart';

class Navigation {}

class NavItem {
  final String? name;
  final String route;
  final String type;
  final List<NavItem> subRoutes;
  final List<ComponentSeed> components;

  NavItem(
    this.name,
    this.route,
    this.type,
    this.subRoutes,
    this.components,
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
