import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/components/config/component_api_config.dart';
import 'component_config.dart';

part 'carousel_config.g.dart';

@JsonSerializable()
class CarouselConfig extends ComponentConfig {
  // final Map<String, dynamic> slideConfig;
  final String? title;

  final bool? hasArrows;
  final bool? hasDots;
  final bool? isAutoPlay;
  @JsonKey(name: 'fullwidthNoPadding')
  final bool? isFullWidth;

  CarouselConfig(rawConfig, ComponentApiConfig apiConfig, this.title,
      this.hasArrows, this.hasDots, this.isAutoPlay, this.isFullWidth)
      : super(rawConfig: rawConfig, apiConfig: apiConfig);

  factory CarouselConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$CarouselConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselConfigToJson(this);
}
