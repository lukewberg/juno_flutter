import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthed = false;

  bool get isAuthed => _isAuthed;

  set isAuthed(bool value) {
    _isAuthed = value;
  }
}