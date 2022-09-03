import 'package:flutter/material.dart';
import 'package:juno_flutter/router/navigation.dart';

class AppProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  Navigation _navigation = Navigation();

  Navigation get navigation => _navigation;

  bool get isDarkMode => _isDarkMode;

  set navigation(Navigation value) {
    _navigation = value;
    notifyListeners();
  }

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
