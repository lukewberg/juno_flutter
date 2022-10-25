import 'package:flutter/material.dart';
import 'package:juno_flutter/components/component_index_extension.dart';
import 'package:juno_flutter/router/navigation.dart';

class ListPage extends StatelessWidget {
  final List<Widget> components;

  const ListPage({Key? key, required this.components}) : super(key: key);

  factory ListPage.fromNav(BuildContext context, NavItem navItem) {
    List<Widget> components = [];
    for (var component in navItem.components) {
      components.add(component.type.component(
          context, component.type.legacyConfig(component.rawConfig)));
    }
    return ListPage(components: [...components]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      addAutomaticKeepAlives: true,
      children: [...components],
    );
  }
}
