import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/router/navigation.dart';

part 'carousel_config.g.dart';

@JsonSerializable()
class CarouselConfig extends ComponentConfig {
  final List<dynamic> slideConfigs;

  CarouselConfig(rawConfig, this.slideConfigs): super(rawConfig: rawConfig);

  factory CarouselConfig.fromJsonLegacy(Map<String, dynamic> json) => _$CarouselConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselConfigToJson(this);
}