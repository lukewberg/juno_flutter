import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/router/navigation.dart';

part 'carousel_config.g.dart';

@JsonSerializable()
class CarouselConfig extends ComponentConfig {
  final Map<String, dynamic> slides;

  CarouselConfig(super.rawConfig, this.slides);

  factory CarouselConfig.fromJsonLegacy(Map<String, dynamic> json) => _$CarouselConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselConfigToJson(this);
}