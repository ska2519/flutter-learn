import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_channel.freezed.dart';
part 'youtube_channel.g.dart';

@freezed
class Channel with _$Channel {
  const factory Channel({
    required String kind,
    required String etag,
    required List<Item> items,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String kind,
    required String etag,
    required String id,
    required Snippet snippet,
    required Statistics statistics,
    required BrandingSettings brandingSettings,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class BrandingSettings with _$BrandingSettings {
  const factory BrandingSettings({
    required ChannelClass channel,
    required Image image,
  }) = _BrandingSettings;

  factory BrandingSettings.fromJson(Map<String, dynamic> json) =>
      _$BrandingSettingsFromJson(json);
}

@freezed
class ChannelClass with _$ChannelClass {
  const factory ChannelClass({
    required String title,
    required String description,
    String? keywords,
    required bool showRelatedChannels,
    required bool showBrowseView,
    String? country,
  }) = _ChannelClass;

  factory ChannelClass.fromJson(Map<String, dynamic> json) =>
      _$ChannelClassFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    required String bannerExternalUrl,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Snippet with _$Snippet {
  const factory Snippet({
    required String title,
    required String description,
    required DateTime publishedAt,
    required Thumbnails thumbnails,
    required Localized localized,
    String? country,
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
    String? subscriberCount,
    required bool hiddenSubscriberCount,
    required String videoCount,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}
