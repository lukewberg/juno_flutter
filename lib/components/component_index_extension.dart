import 'package:flutter/material.dart';
import 'package:juno_flutter/components/blurb.dart';
import 'package:juno_flutter/components/carousel.dart';
import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/components/config/action_button_config.dart';
import 'package:juno_flutter/components/config/carousel_config.dart';
import 'package:juno_flutter/components/config/grid_config.dart';
import 'package:juno_flutter/components/grid.dart';

import 'config/component_config.dart';

typedef ConfigBuilder = ComponentConfig Function(Map<String, dynamic> config);
typedef ComponentBuilder = Widget Function(BuildContext context, dynamic config);

extension ComonentIndexExtension on COMPONENT_INDEX {
  ConfigBuilder get legacyConfig {
    switch (this) {
      case COMPONENT_INDEX.actionButton:
        return (config) => ActionButtonConfig.fromJsonLegacy(config);
      case COMPONENT_INDEX.carousel:
        return (config) => CarouselConfig.fromJsonLegacy(config);
      case COMPONENT_INDEX.grid:
        return (config) => GridConfig.fromJsonLegacy(config);
      default:
        return (config) => ComponentConfig(rawConfig: config);
    }
  }

  ComponentBuilder get component {
    switch (this) {
      case COMPONENT_INDEX.carousel:
        return (context, config) => Carousel.fromConfig(config);
      case COMPONENT_INDEX.grid:
        return (context, config) => Grid.fromConfig(config);
      case COMPONENT_INDEX.blurb:
        return (context, config) => Blurb.fromConfig(config);
      default:
        return (context, config) => const Text('No Component Found :(');
    }
  }
}
