import 'package:flutter/material.dart';
import 'package:juno_flutter/components/juno_appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:JunoAppbar(),
      body: SingleChildScrollView(
        child: Text("Hello world")
      )
    );
  }
}

