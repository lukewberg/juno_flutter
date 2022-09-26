import 'package:go_router/go_router.dart';
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

  GoRouter get router => _router;

  set nav(Navigation value) {
    _navigation = value;
  }

  AppRouter(this.appService, this.authService);

  late final _router = GoRouter(
      refreshListenable: authService,
      routes: [
        GoRoute(
            path: APP_PAGE.home.path,
            builder: (context, state) => ListPage(
                components: AppService.appPageBuilder(
                    context, _navigation.getNavItem(APP_PAGE.home.path))),
            name: APP_PAGE.home.name),
        GoRoute(
            path: APP_PAGE.login.path,
            builder: (context, state) => const LoginPage(),
            name: APP_PAGE.login.name)
      ],
      redirect: (state) {
        final isGoingToLogin = state.subloc == APP_PAGE.login.path;

        if (!authService.isAuthed && !isGoingToLogin) {
          return APP_PAGE.login.path;
        }
        return null;
      });
}
