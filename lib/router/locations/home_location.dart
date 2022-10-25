import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/pages/content_page.dart';
import 'package:juno_flutter/pages/list_page.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';
import 'package:juno_flutter/router/navigation.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:provider/provider.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var navigation = Provider.of<Navigation>(context, listen: false);
    return [
      BeamPage(
        key: ValueKey('home_page-${DateTime.now()}'),
        child: ListPage(
          components: [
            ...AppService.appPageBuilder(
              context,
              navigation.getNavItem(APP_PAGE.home.path),
            ),
          ],
        ),
      ),
      // if (state.pathParameters.containsKey('content'))
      //   BeamPage(
      //     key: ValueKey('content_page-${DateTime.now()}'),
      //     child: ContentPage(
      //       content: data as Content,
      //     ),
      //   ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['${APP_PAGE.home.path}/:content'];
}
