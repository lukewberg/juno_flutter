import 'package:flutter/material.dart';
import 'package:juno_flutter/api/api.dart';
import 'package:juno_flutter/api/legacy_api.dart';
import 'package:juno_flutter/router/navigation.dart';

typedef LoginCallback = void Function(bool success);

class AuthService with ChangeNotifier {
  bool _isAuthed = false;

  bool get isAuthed => _isAuthed;

  set isAuthed(bool value) {
    _isAuthed = value;
  }

  Future<AuthResult> login(String magicLink) async {
    var result = await LegacyAPI().authenticate(Uri.parse(magicLink));
    notifyListeners();
    _isAuthed = true;
    return result;
  }
}
