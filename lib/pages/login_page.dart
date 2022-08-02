import 'package:flutter/material.dart';
import 'package:juno_flutter/components/juno_appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

