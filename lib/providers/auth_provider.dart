import 'package:flutter/material.dart';
import 'package:juno_flutter/api/legacy_api.dart';

typedef LoginCallback = void Function(bool success);

class AuthProvider with ChangeNotifier {
  bool _isAuthed = false;

  bool get isAuthed => _isAuthed;

  set isAuthed(bool value) {
    _isAuthed = value;
  }

  Future<bool> login(String magicLink, LoginCallback? callback) async {
    var result =
        await LegacyAPI().authenticate(Uri.parse(magicLink)).then((value) {
      _isAuthed = true;
      notifyListeners();
      if (callback != null) {
        callback(true);
      }
    });
    if (result) {
      return true;
    } else {
      return false;
    }
  }
}
