// To parse this JSON data, do
//     final playlistItems = playlistItemsFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_playlist_items.freezed.dart';
part 'youtube_playlist_items.g.dart';

PlaylistItems playlistItemsFromJson(String str) =>
    PlaylistItems.fromJson(json.decode(str) as Map<String, dynamic>);

String playlistItemsToJson(PlaylistItems data) => json.encode(data.toJson());

@freezed
class PlaylistItems with _$PlaylistItems {
  const factory PlaylistItems({
    required String kind,
    required String etag,
    String? nextPageToken,
    String? prevPageToken,
    required List<Item> items,
    required PageInfo pageInfo,
  }) = _PlaylistItems;

  factory PlaylistItems.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemsFromJson(json);
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
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class ContentDetails with _$ContentDetails {
  const factory ContentDetails({
    required String videoId,
    DateTime? videoPublishedAt,
  }) = _ContentDetails;

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);
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
    required String playlistId,
    required int position,
    required ResourceId resourceId,
    String? videoOwnerChannelTitle,
    String? videoOwnerChannelId,
  }) = _Snippet;

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}

@freezed
class ResourceId with _$ResourceId {
  const factory ResourceId({
    required String kind,
    required String videoId,
  }) = _ResourceId;

  factory ResourceId.fromJson(Map<String, dynamic> json) =>
      _$ResourceIdFromJson(json);
}

@freezed
class Thumbnails with _$Thumbnails {
  const factory Thumbnails({
    @JsonKey(name: 'default') Thumbnail? dflt,
    Thumbnail? medium,
    Thumbnail? high,
    Thumbnail? standard,
    Thumbnail? maxres,
  }) = _Thumbnails;

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
  const factory Thumbnail({
    required String url,
    required int width,
    required int height,
  }) = _Thumbnail;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}

@freezed
class Status with _$Status {
  const factory Status({
    required String privacyStatus,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
class PageInfo with _$PageInfo {
  const factory PageInfo({
    required int totalResults,
    required int resultsPerPage,
  }) = _PageInfo;

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);
}
