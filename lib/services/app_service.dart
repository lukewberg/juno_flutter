import 'package:flutter/material.dart';
import 'package:juno_flutter/components/component_index_extension.dart';
import 'package:juno_flutter/router/navigation.dart';

class AppService with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  static List<Widget> appPageBuilder(BuildContext context, NavItem navItem) {
    List<Widget> components = [];
    for (var component in navItem.components) {
      var config = component.type.legacyConfig(component.rawConfig);
      var widget = component.type.component(context, config);
      components.add(widget);
    }
    return components;
  }
}
