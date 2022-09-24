import 'package:json_annotation/json_annotation.dart';
import 'component_config.dart';

part 'action_button_config.g.dart';

@JsonSerializable()
class ActionButtonConfig extends ComponentConfig {
  ActionButtonConfig(rawConfig) : super(rawConfig: rawConfig);

  factory ActionButtonConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$ActionButtonConfigFromJson(json);
}
