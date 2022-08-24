import 'package:flutter/material.dart';
import 'package:juno_flutter/components/juno_appbar.dart';

class GridContentPage extends StatelessWidget {
  final List<Widget> components;

  const GridContentPage({Key? key, required this.components}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const JunoAppbar(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        children: components,
      ),
    );
  }
}
