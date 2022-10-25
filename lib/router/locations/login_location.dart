import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:juno_flutter/pages/login_page.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('login_page-${DateTime.now()}'),
        child: const LoginPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [APP_PAGE.login.path];
}
