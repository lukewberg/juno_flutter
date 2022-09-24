import 'package:json_annotation/json_annotation.dart';
import 'component_config.dart';

part 'grid_config.g.dart';

@JsonSerializable()
class GridConfig extends ComponentConfig {
  GridConfig(rawConfig, apiConfig) : super(rawConfig: rawConfig);

  factory GridConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$GridConfigFromJson(json);
}
