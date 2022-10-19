import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/juno_appbar.dart';
import 'package:juno_flutter/components/juno_bottombar.dart';
import 'package:juno_flutter/pages/content_page.dart';
import 'package:juno_flutter/pages/list_page.dart';
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
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => _router;

  set nav(Navigation value) {
    _navigation = value;
  }

  AppRouter(this.appService, this.authService);

  late final _router = GoRouter(
      refreshListenable: authService,
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return Scaffold(
              extendBody: true,
              appBar: const JunoAppbar(),
              body: child,
              bottomNavigationBar: const JunoBottomBar(),
            );
          },
          routes: [
            GoRoute(
                path: APP_PAGE.home.path,
                builder: (context, state) => ListPage(
                    components: AppService.appPageBuilder(
                        context, _navigation.getNavItem(APP_PAGE.home.path))),
                name: APP_PAGE.home.name),
            GoRoute(
              path: APP_PAGE.content.path,
              builder: (context, state) => ContentPage(
                content: state.extra as Content,
              ),
              name: APP_PAGE.content.name,
            )
          ]
        ),
        GoRoute(
            path: APP_PAGE.login.path,
            builder: (context, state) => const LoginPage(),
            name: APP_PAGE.login.name),
      ],
      redirect: (context, state) {
        final isGoingToLogin = state.subloc == APP_PAGE.login.path;

        if (!authService.isAuthed && !isGoingToLogin) {
          return APP_PAGE.login.path;
        }
        return null;
      });

  void routeToContent(Content content) {
    _router.goNamed(APP_PAGE.content.name, extra: content);
    return;
    switch (content.bucket) {
      case BUCKETS.Library:
        // _navigation.goToHome();
        break;
      case BUCKETS.Lesson:
        // _navigation.goToLogin();
        break;
      default:
        _router.goNamed(APP_PAGE.content.path, extra: content);
        break;
      // _navigation.goToHome();
    }
  }
}
