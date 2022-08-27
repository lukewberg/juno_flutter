import 'package:json_annotation/json_annotation.dart';

part 'blurb_config.g.dart';

@JsonSerializable()
class BlurbConfig {

  final Map<String, dynamic> content;

  BlurbConfig({required this.content});

  factory BlurbConfig.fromJsonLegacy(Map<String, dynamic> json) => _$BlurbConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BlurbConfigToJson(this);

}