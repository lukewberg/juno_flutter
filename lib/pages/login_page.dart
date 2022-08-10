import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juno_flutter/api/legacy_api.dart';
import 'package:juno_flutter/components/action_button.dart';
import 'package:juno_flutter/components/juno_appbar.dart';
import 'package:juno_flutter/components/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final magicLinkController = TextEditingController();

  @override
  void dispose() {
    magicLinkController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff271836),
                Color(0xff6F67AE),
                Color(0xffE26B76)
              ]),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/img/juno_logo.svg',
                    color: Colors.white,
                  ),
                  const Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextInput(
                      placeholder: 'Magic link',
                      inputType: TextInputType.text,
                      controller: magicLinkController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ActionButton('Log in', () {
                    LegacyAPI().getSite(Uri.parse(magicLinkController.text));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
