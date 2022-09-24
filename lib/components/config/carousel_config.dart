import 'package:json_annotation/json_annotation.dart';
import 'component_config.dart';

part 'carousel_config.g.dart';

@JsonSerializable()
class CarouselConfig extends ComponentConfig {
  // final Map<String, dynamic> slideConfig;
  final String? title;

  final bool? hasArrows;
  final bool? hasDots;

  CarouselConfig(rawConfig, this.title, this.hasArrows, this.hasDots)
      : super(rawConfig: rawConfig);

  factory CarouselConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$CarouselConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselConfigToJson(this);
}
