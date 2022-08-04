import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextInput extends StatefulWidget {
  final String? placeholder;
  final TextInputType? inputType;
  final bool? password;
  const TextInput({Key? key, this.placeholder, this.inputType, this.password}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10, color: Colors.black26, offset: Offset(0, 7)),
        ],
      ),
      child: TextField(
        obscureText: widget.password ?? false,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(width: 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(width: 0)),
          enabled: true,
          fillColor: Colors.white,
          filled: true,
          hoverColor: Colors.green,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: widget.placeholder,
        ),
      ),
    );
  }
}
