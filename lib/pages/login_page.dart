import 'dart:ui';

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
        body: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [
                    0.25,
                    0.5,
                    0.75
                  ],
                  colors: [
                    Color(0xff6F67AE),
                    Color(0xffBF2E92),
                    Color(0xffE26B76)
                  ]),
            ),
            child: SafeArea(
              child: Center(
                child: Text('Hello world!'),
              ),
            )));
  }
}
