import 'package:flutter/material.dart';
import 'package:juno_flutter/router/navigation.dart';

class AppService with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
