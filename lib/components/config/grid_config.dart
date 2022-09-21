import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/router/navigation.dart';

part 'grid_config.g.dart';

@JsonSerializable()
class GridConfig extends ComponentConfig {
  GridConfig(rawConfig, apiConfig) : super(rawConfig: rawConfig, apiConfig: apiConfig);

  factory GridConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$GridConfigFromJson(json);
}
