import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/components/config/component_api_config.dart';
import 'component_config.dart';

part 'grid_config.g.dart';

@JsonSerializable()
class GridConfig extends ComponentConfig {
  final String title;
  @JsonKey(name: 'grid_class', readValue: _readGridClass)
  final bool isRound;

  GridConfig(rawConfig, ComponentApiConfig apiConfig, this.title, this.isRound)
      : super(rawConfig: rawConfig, apiConfig: apiConfig);

  factory GridConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$GridConfigFromJson(json);

  static Object? _readGridClass(Map<dynamic, dynamic> json, String key) {
    return json[key] == 'RoundGridItem';
  }
}
