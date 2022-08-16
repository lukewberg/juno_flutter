import 'package:flutter/material.dart';
import 'package:juno_flutter/components/action_button.dart';
import 'package:juno_flutter/components/carousel.dart';
import 'package:juno_flutter/components/component_index.dart';
import 'package:juno_flutter/router/navigation.dart';

typedef ComponentConfig configBuilder(BuildContext context, dynamic config);
typedef Widget componentBuilder(BuildContext context, dynamic config);

extension ComonentIndexExtension on COMPONENT_INDEX {
  configBuilder get config {
    switch (this) {
      case COMPONENT_INDEX.actionButton:
        return (context, config) => ActionButtonConfig(config);
      case COMPONENT_INDEX.carousel:
        return (context, config) => CarouselConfig(config);
      default:
        return (context, config) => ComponentConfig();
    }
  }

  componentBuilder get component {
    switch (this) {
      case COMPONENT_INDEX.carousel:
        return (context, config) => Carousel.fromConfig(config);
      default:
        return (context, config) => const Text('No Component Found :(');
    }
  }
}
