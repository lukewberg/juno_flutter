import 'package:flutter/material.dart';
import 'package:juno_flutter/components/config/grid_config.dart';

class Grid extends StatelessWidget {
  // final List<dynamic> children;
  const Grid({Key? key}) : super(key: key);

  factory Grid.fromConfig(GridConfig config) {
    return const Grid();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('This is a grid'),
    );
  }
}
