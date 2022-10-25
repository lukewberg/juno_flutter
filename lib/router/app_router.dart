import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:juno_flutter/pages/app_scaffold.dart';
import 'package:juno_flutter/pages/login_page.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:juno_flutter/services/auth_service.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';
import 'package:juno_flutter/router/navigation.dart';

class AppRouter {
  late final AppService appService;
  late final AuthService authService;
  late final Navigation _navigation;

  // BeamerDelegate get router => _router;

  set nav(Navigation value) {
    _navigation = value;
  }

  AppRouter(this.appService, this.authService);

  // late final _router = GoRouter(
  //     refreshListenable: authService,
  //     navigatorKey: _rootNavigatorKey,
  //     routes: [
  //       ShellRoute(
  //         navigatorKey: _shellNavigatorKey,
  //         pageBuilder: (context, state, child) {
  //           return MaterialPage<void>(
  //             child: Scaffold(
  //               extendBody: true,
  //               appBar: const JunoAppbar(),
  //               body: child,
  //               bottomNavigationBar: const JunoBottomBar(),
  //             ),
  //           );
  //         },
  //         routes: [
  //           GoRoute(
  //               path: APP_PAGE.home.path,
  //               pageBuilder: (context, state) => MaterialPage(
  //                     child: ListPage(
  //                       components: AppService.appPageBuilder(
  //                         context,
  //                         _navigation.getNavItem(APP_PAGE.home.path),
  //                       ),
  //                     ),
  //                   ),
  //               name: APP_PAGE.home.name),
  //           GoRoute(
  //             path: APP_PAGE.content.path,
  //             pageBuilder: (context, state) => MaterialPage<void>(
  //               child: ContentPage(
  //                 content: state.extra as Content,
  //               ),
  //             ),
  //             name: APP_PAGE.content.name,
  //           )
  //         ],
  //       ),
  //       GoRoute(
  //           path: APP_PAGE.login.path,
  //           pageBuilder: (context, state) =>
  //               const MaterialPage<void>(child: LoginPage()),
  //           name: APP_PAGE.login.name),
  //     ],
  //     redirect: (context, state) {
  //       final isGoingToLogin = state.subloc == APP_PAGE.login.path;
  //
  //       if (!authService.isAuthed && !isGoingToLogin) {
  //         return APP_PAGE.login.path;
  //       }
  //       return null;
  //     });
}
