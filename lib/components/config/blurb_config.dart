import 'package:json_annotation/json_annotation.dart';
import 'component_config.dart';

part 'blurb_config.g.dart';

@JsonSerializable()
class BlurbConfig extends ComponentConfig {
  final Map<String, dynamic> content;

  BlurbConfig(rawConfig, {required this.content}) : super(rawConfig: rawConfig);

  factory BlurbConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$BlurbConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BlurbConfigToJson(this);
}
