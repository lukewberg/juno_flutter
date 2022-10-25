import 'package:flutter/cupertino.dart';
import 'package:juno_flutter/components/component_index.dart';

import 'app_page.dart';

class Navigation with ChangeNotifier{
  static final Navigation _instance = Navigation._internal();
  List<NavItem>? _routes;

  set routes(List<NavItem>? value) {
    _routes = value;
    notifyListeners();
  }

  List<NavItem>? get routes => _routes;

  NavItem getNavItem(String path) {
    return routes!.firstWhere((element) => element.route == path);
  }

  factory Navigation({List<NavItem>? routes}) {
    _instance.routes = routes;
    return _instance;
  }

  Navigation._internal();

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
