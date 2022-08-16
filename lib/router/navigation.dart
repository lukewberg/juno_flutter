import 'package:juno_flutter/components/action_button.dart';

class Navigation {}

class NavItem {
  final String? name;
  final String route;
  final String type;
  final Map<String, dynamic>? data;
  final List<NavItem> children;

  NavItem(
    this.name,
    this.route,
    this.type,
    this.children, {
    this.data,
  });
}

class ComponentConfig {
  ComponentConfig();
}
