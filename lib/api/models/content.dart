import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  @JsonKey(name: 'content_id')
  final String id;
  @JsonKey(name: 'content_name')
  final String name;
  @JsonKey(name: 'content_description')
  final String? description;
  @JsonKey(name: 'content_social_description')
  final String? socialDescription;
  @JsonKey(name: 'content_author')
  final String author;
  @JsonKey(name: 'content_slug')
  final String slug;
  @JsonKey(name: 'content_date')
  final DateTime date;
  @JsonKey(name: 'content_date_start')
  final DateTime? startDate;
  @JsonKey(name: 'content_date_end')
  final DateTime? endDate;
  // @JsonKey(name: 'content_datecreated')
  // final DateTime created;
  @JsonKey(name: 'content_dateupdated')
  final DateTime lastUpdated;
  @JsonKey(name: 'content_image')
  final String? image;
  @JsonKey(name: ' content_image')
  final String? thumbnail;
  @JsonKey(name: 'content_img_srcset')
  final List<Uri> sourceSet;
  @JsonKey(name: 'content_active')
  final bool isActive;
  @JsonKey(name: 'content_featured')
  final bool isFeatured;

  Content(
      this.id,
      this.name,
      this.description,
      this.socialDescription,
      this.author,
      this.slug,
      this.date,
      this.startDate,
      this.endDate,
      // this.created,
      this.lastUpdated,
      this.image,
      this.thumbnail,
      this.sourceSet,
      this.isActive,
      this.isFeatured);

factory Content.fromJsonLegacy(Map<String, dynamic> json) => _$ContentFromJson(json);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

enum BUCKETS {
  OTSession,
  IRLSession,
  BreakoutSession,
  Media,
  Blurb,
  Resource,
  Speaker,
  Partner,
  Library,
  Track,
  Lesson,
  Ad,
  Leaderboard,
  Cohort,
  Product,
  Community,
  ForumTopic,
  ForumPost,
}

extension BucketsExtension on BUCKETS {
  String get name => toString().split('.').last;
}