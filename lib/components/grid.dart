import 'package:flutter/material.dart';
import 'package:juno_flutter/components/config/grid_config.dart';
import 'package:juno_flutter/components/grids/round_grid_item.dart';
import 'package:juno_flutter/components/grids/square_grid_item.dart';

class Grid extends StatelessWidget {
  final String title;
  final List<Widget> gridItems;

  const Grid({Key? key, required this.title, required this.gridItems})
      : super(key: key);

  factory Grid.fromConfig(GridConfig config) {
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
