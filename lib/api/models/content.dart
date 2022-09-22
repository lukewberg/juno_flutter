import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  final String id;
  final String name;
  final String? description;
  final String? socialDescription;
  final String author;
  final String slug;
  final DateTime date;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime created;
  final DateTime lastUpdated;
  final String? image;
  final String? thumbnail;
  final List<Uri> sourceSet;
  final bool isActive;
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
      this.created,
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
  Session,
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