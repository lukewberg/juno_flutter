import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:juno_flutter/pages/app_scaffold.dart';
import 'package:juno_flutter/router/app_router.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:juno_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class AppLocation extends BeamLocation<BeamState> {
  AppLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  Widget builder(BuildContext context, Widget navigator) => MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
          ChangeNotifierProvider<AppService>(create: (_) => AppService()),
          Provider(create: (_) => AppRouter(AppService(), AuthService())),
        ],
        child: navigator,
      );

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('app_page-${DateTime.now()}'),
        name: 'app_page',
        child: const AppScaffold(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/app'];
}
