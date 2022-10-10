import 'package:flutter/material.dart';
import 'package:juno_flutter/components/config/grid_config.dart';

class Grid extends StatelessWidget {
  final String title;
  final List<Widget> gridItems;

  const Grid({Key? key, required this.title, required this.gridItems})
      : super(key: key);

  factory Grid.fromConfig(GridConfig config) {
    return Grid(
      title: config.title,
      gridItems: config.contentList
          .map((e) => Container(
                color: Colors.red,
                child: Text(e.name),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('This is a grid'),
    );
  }
}
