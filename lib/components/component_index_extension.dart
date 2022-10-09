import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/blurb.dart';
import 'package:juno_flutter/components/carousel.dart';
import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/components/config/action_button_config.dart';
import 'package:juno_flutter/components/config/carousel_config.dart';
import 'package:juno_flutter/components/config/grid_config.dart';
import 'package:juno_flutter/components/grid.dart';

import 'config/blurb_config.dart';
import 'config/component_config.dart';

typedef ConfigBuilder = ComponentConfig Function(Map<String, dynamic> config);
typedef ComponentBuilder = FutureBuilder<List<Content>> Function(
    BuildContext context, dynamic config);

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
        return (context, config) {
          config = config as CarouselConfig;
          return FutureBuilder(
              future: config.futureContentList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  config.contentList = snapshot.data ?? [];
                  return Carousel.fromConfig(config as CarouselConfig);
                } else {
                  return const Text('Loading');
                }
              });
        };
      case COMPONENT_INDEX.grid:
        return (context, config) {
          config as GridConfig;
          return FutureBuilder(
              future: config.futureContentList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  config.contentList = snapshot.data ?? [];
                  return Grid.fromConfig(config);
                } else {
                  return const Text('Loading');
                }
              });
        };
      case COMPONENT_INDEX.blurb:
        return (context, config) {
          config as BlurbConfig;
          return FutureBuilder(
              future: config.futureContentList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  config.contentList = snapshot.data ?? [];
                  return Blurb.fromConfig(config);
                } else {
                  return const Text('Loading');
                }
              });
        };
      default:
        return (context, config) {
          config as ComponentConfig;
          return FutureBuilder(
              future: config.futureContentList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  config.contentList = snapshot.data ?? [];
                  return Text('This is a $name');
                } else {
                  return const Text('Loading');
                }
              });
        };
    }
  }
}
