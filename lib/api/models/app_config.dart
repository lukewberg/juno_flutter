import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  @JsonKey(name: 'S3_IMAGEBUCKET_LOCATION')
  final String s3BucketUrl;

  AppConfig(this.s3BucketUrl);

  factory AppConfig.fromJsonLegacy(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
