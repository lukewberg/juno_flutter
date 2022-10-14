import 'package:flutter/material.dart';
import 'package:juno_flutter/components/config/grid_config.dart';
import 'package:juno_flutter/components/square_grid_item.dart';

class Grid extends StatelessWidget {
  final String title;
  final List<Widget> gridItems;

  const Grid({Key? key, required this.title, required this.gridItems})
      : super(key: key);

  factory Grid.fromConfig(GridConfig config) {
    return Grid(
      title: config.title,
      gridItems: config.contentList
          .map((e) => SquareGridItem(
                title: e.name,
                imageUrl: e.image ?? '',
                subtitle: e.description,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(title),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: gridItems,
          ),
        ],
      ),
    );
  }
}
