import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:juno_flutter/components/config/grid_config.dart';
import 'package:juno_flutter/components/grids/round_grid_item.dart';
import 'package:juno_flutter/components/grids/square_grid_item.dart';
import 'package:juno_flutter/router/app_page.dart';
import 'package:juno_flutter/router/app_page_extension.dart';

class Grid extends StatelessWidget {
  final String title;
  final List<Widget> gridItems;

  const Grid({Key? key, required this.title, required this.gridItems})
      : super(key: key);

  factory Grid.fromConfig(BuildContext context, GridConfig config) {
    return Grid(
      title: config.title,
      gridItems: config.contentList.map((e) {
        if (config.isRound) {
          return RoundGridItem(
            title: e.name,
            imageUrl: e.image ?? '',
            subtitle: e.description,
          );
        } else {
          return SquareGridItem(
            title: e.name,
            imageUrl: e.image ?? '',
            subtitle: e.description,
            onTap: () {
              context.beamToNamed(APP_PAGE.content.path, data: e);
            },
          );
        }
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(title),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: gridItems,
          ),
        ],
      ),
    );
  }
}
