import 'package:flutter/material.dart';
import 'package:juno_flutter/api/legacy_api.dart';

typedef LoginCallback = void Function(bool success);

class AuthProvider with ChangeNotifier {
  bool _isAuthed = false;

  bool get isAuthed => _isAuthed;

  set isAuthed(bool value) {
    _isAuthed = value;
  }

  Future<bool> login(String magicLink) async {
    var result = await LegacyAPI().authenticate(Uri.parse(magicLink));
    notifyListeners();
    _isAuthed = true;
    return true;
  }
}
