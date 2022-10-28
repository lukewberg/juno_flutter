import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:juno_flutter/components/juno_appbar.dart';
import 'package:juno_flutter/components/juno_bottombar.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';
import 'package:juno_flutter/router/locations/home_location.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final routerDelegates = [
    BeamerDelegate(
      initialPath: APP_PAGE.home.path,
      locationBuilder: (routeInformation, _) {
        return HomeLocation(routeInformation);
      }
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: [
          Beamer(
            routerDelegate: routerDelegates[0],
          )
        ],
      ),
      extendBody: true,
      appBar: const JunoAppbar(),
      bottomNavigationBar: const JunoBottomBar(
        currentIndex: 0,
      ),
    );
  }
}
