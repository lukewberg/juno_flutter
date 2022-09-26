import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/app_config.dart';
import 'package:juno_flutter/components/component_index_extension.dart';
import 'package:juno_flutter/router/navigation.dart';

class AppService with ChangeNotifier {
  bool _isDarkMode = false;
  late AppConfig _appConfig;

  bool get isDarkMode => _isDarkMode;
  AppConfig get appConfig => _appConfig;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  set appConfig(AppConfig value) {
    _appConfig = value;
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
