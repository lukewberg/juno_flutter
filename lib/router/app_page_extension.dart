import 'package:juno_flutter/router/app_page.dart';

extension AppPageExtension on APP_PAGE {
  String get path {
    switch (this) {

      case APP_PAGE.splash:
        return '/splash';
      case APP_PAGE.login:
        return '/login';
      case APP_PAGE.home:
        return '/home';
      case APP_PAGE.chat:
        return '/chat';
      case APP_PAGE.content:
        return '/content';
      case APP_PAGE.live:
        return '/live';
    }
  }

  String get name {
    switch (this) {

      case APP_PAGE.splash:
        return 'SPLASH';
      case APP_PAGE.login:
        return 'LOGIN';
      case APP_PAGE.home:
        return 'HOME';
      case APP_PAGE.chat:
        return 'CHAT';
      case APP_PAGE.content:
        return 'CONTENT';
      case APP_PAGE.live:
        return 'LIVE';
      default:
        return 'HOME';
    }
  }

  String get title {
    switch (this) {

      case APP_PAGE.splash:
        return 'Juno Splash Page';
      case APP_PAGE.login:
        return 'Juno Login Page';
      case APP_PAGE.home:
        return 'Juno Home Page';
      case APP_PAGE.chat:
        return 'Juno Chat Page';
      case APP_PAGE.content:
        return 'Juno Content Page';
      case APP_PAGE.live:
        return 'Juno Live Page';
      default:
        return 'Juno';
    }
  }
}