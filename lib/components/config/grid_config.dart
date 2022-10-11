import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/components/config/component_api_config.dart';
import 'component_config.dart';

part 'grid_config.g.dart';

@JsonSerializable()
class GridConfig extends ComponentConfig {
  final String title;

  GridConfig(rawConfig, ComponentApiConfig apiConfig, this.title)
      : super(rawConfig: rawConfig, apiConfig: apiConfig);

  factory GridConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$GridConfigFromJson(json);
}
