import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_video.freezed.dart';
part 'youtube_video.g.dart';

@freezed
class YouTubeVideo with _$YouTubeVideo {
  const factory YouTubeVideo({
    required String kind,
    required String etag,
    required List<Item> items,
  }) = _YouTubeVideo;

  factory YouTubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YouTubeVideoFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String kind,
    required String etag,
    required String id,
    required Snippet snippet,
    required ContentDetails contentDetails,
    required Status status,
    required Statistics statistics,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class ContentDetails with _$ContentDetails {
  const factory ContentDetails({
    required String duration,
    required String dimension,
    required String definition,
    required String caption,
    required bool licensedContent,
    required ContentRating contentRating,
    required String projection,
  }) = _ContentDetails;

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);
}

@freezed
class ContentRating with _$ContentRating {
  const factory ContentRating() = _ContentRating;

  factory ContentRating.fromJson(Map<String, dynamic> json) =>
      _$ContentRatingFromJson(json);
}

@freezed
class Snippet with _$Snippet {
  const factory Snippet({
    required DateTime publishedAt,
    required String channelId,
    required String title,
    required String description,
    required Thumbnails thumbnails,
    required String channelTitle,
    required String categoryId,
    required String liveBroadcastContent,
    required Localized localized,
    String? defaultAudioLanguage,
  }) = _Snippet;

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}

@freezed
class Localized with _$Localized {
  const factory Localized({
    required String title,
    required String description,
  }) = _Localized;

  factory Localized.fromJson(Map<String, dynamic> json) =>
      _$LocalizedFromJson(json);
}

@freezed
class Thumbnails with _$Thumbnails {
  const factory Thumbnails({
    Default? thumbnailsDefault,
    Default? medium,
    Default? high,
    Default? standard,
    Default? maxres,
  }) = _Thumbnails;

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);
}

@freezed
class Default with _$Default {
  const factory Default({
    required String url,
    required int width,
    required int height,
  }) = _Default;

  factory Default.fromJson(Map<String, dynamic> json) =>
      _$DefaultFromJson(json);
}

@freezed
class Statistics with _$Statistics {
  const factory Statistics({
    required String viewCount,
    required String likeCount,
    required String dislikeCount,
    required String favoriteCount,
    required String commentCount,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}

@freezed
class Status with _$Status {
  const factory Status({
    required String uploadStatus,
    required String privacyStatus,
    required String license,
    required bool embeddable,
    required bool publicStatsViewable,
    required bool madeForKids,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
