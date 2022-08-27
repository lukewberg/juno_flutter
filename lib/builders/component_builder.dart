import 'package:flutter/material.dart';
import 'package:juno_flutter/components/component_index_extension.dart';
import 'package:juno_flutter/router/navigation.dart';

class ComponentBuilder extends StatelessWidget {
  final List<ComponentSeed> componentSeeds;
  const ComponentBuilder({Key? key, required this.componentSeeds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> components = [];
    for (var component in componentSeeds) {
      component.type.config(component.rawConfig);
    }
    return Container();
  }
}
