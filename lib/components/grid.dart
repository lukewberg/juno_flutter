import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/config/grid_config.dart';

import 'config/component_api_config.dart';

class Grid extends StatelessWidget {
  final List<Content> content;
  const Grid({Key? key, required this.apiConfig}) : super(key: key);

  factory Grid.fromConfig(GridConfig config) {
    return Grid(apiConfig: config.apiConfig);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('This is a grid'),
    );
  }
}
