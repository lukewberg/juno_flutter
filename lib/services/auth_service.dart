import 'package:flutter/material.dart';
import 'package:juno_flutter/api/api.dart';
import 'package:juno_flutter/api/legacy_api.dart';

typedef LoginCallback = void Function(bool success);

class AuthService with ChangeNotifier {
  static final AuthService _instance = AuthService._internal();
  bool _isAuthed = false;

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  bool get isAuthed {
    print('AuthService.isAuthed: $_isAuthed');
    return _isAuthed;
  }

  set isAuthed(bool value) {
    _isAuthed = value;
    print('SET AuthService.isAuthed: $_isAuthed');
    notifyListeners();
  }

  Future<AuthResult> login(String magicLink) async {
    var result = await LegacyAPI().authenticate(Uri.parse(magicLink));
    _isAuthed = true;
    return result;
  }
}
