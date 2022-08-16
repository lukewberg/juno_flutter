import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/router/navigation.dart';

extension ComonentIndexExtension on COMPONENT_INDEX {
  ComponentConfig get config {
    switch(this) {
      default:
        return ComponentConfig();
    }
  }
}