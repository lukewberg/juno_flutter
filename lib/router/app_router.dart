import 'package:go_router/go_router.dart';
import 'package:juno_flutter/main.dart';
import 'package:juno_flutter/pages/login_page.dart';
import 'package:juno_flutter/providers/app_provider.dart';
import 'package:juno_flutter/providers/auth_provider.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';

class AppRouter {
  late final AppProvider appProvider;
  late final AuthProvider authProvider;

  GoRouter get router => _router;

  AppRouter(this.appProvider, this.authProvider);

  late final _router = GoRouter(
      refreshListenable: authProvider,
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) =>
                const MyHomePage(title: 'Flutter Demo Home Page'),
            name: APP_PAGE.home.name),
        GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
            name: APP_PAGE.login.name)
      ],
      redirect: (state) {

        final isGoingToLogin = state.subloc == APP_PAGE.login.path;

        if (!authProvider.isAuthed && !isGoingToLogin) {
          return APP_PAGE.login.path;
        }
        return null;
      });
}
