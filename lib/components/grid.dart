import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/config/grid_config.dart';

import 'config/component_api_config.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  factory Grid.fromConfig(GridConfig config) {
    return Grid();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('This is a grid'),
    );
  }
}
