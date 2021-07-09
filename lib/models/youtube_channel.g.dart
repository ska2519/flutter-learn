// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Channel _$_$_ChannelFromJson(Map json) {
  return _$_Channel(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ChannelToJson(_$_Channel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_$_Item _$_$_ItemFromJson(Map json) {
  return _$_Item(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: json['id'] as String,
    snippet:
        Snippet.fromJson(Map<String, dynamic>.from(json['snippet'] as Map)),
    statistics: Statistics.fromJson(
        Map<String, dynamic>.from(json['statistics'] as Map)),
    brandingSettings: BrandingSettings.fromJson(
        Map<String, dynamic>.from(json['brandingSettings'] as Map)),
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet.toJson(),
      'statistics': instance.statistics.toJson(),
      'brandingSettings': instance.brandingSettings.toJson(),
    };

_$_BrandingSettings _$_$_BrandingSettingsFromJson(Map json) {
  return _$_BrandingSettings(
    channel: ChannelClass.fromJson(
        Map<String, dynamic>.from(json['channel'] as Map)),
    image: Image.fromJson(Map<String, dynamic>.from(json['image'] as Map)),
  );
}

Map<String, dynamic> _$_$_BrandingSettingsToJson(
        _$_BrandingSettings instance) =>
    <String, dynamic>{
      'channel': instance.channel.toJson(),
      'image': instance.image.toJson(),
    };

_$_ChannelClass _$_$_ChannelClassFromJson(Map json) {
  return _$_ChannelClass(
    title: json['title'] as String,
    description: json['description'] as String,
    keywords: json['keywords'] as String?,
    showRelatedChannels: json['showRelatedChannels'] as bool,
    showBrowseView: json['showBrowseView'] as bool,
    country: json['country'] as String?,
  );
}

Map<String, dynamic> _$_$_ChannelClassToJson(_$_ChannelClass instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'keywords': instance.keywords,
      'showRelatedChannels': instance.showRelatedChannels,
      'showBrowseView': instance.showBrowseView,
      'country': instance.country,
    };

_$_Image _$_$_ImageFromJson(Map json) {
  return _$_Image(
    bannerExternalUrl: json['bannerExternalUrl'] as String,
  );
}

Map<String, dynamic> _$_$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'bannerExternalUrl': instance.bannerExternalUrl,
    };

_$_Snippet _$_$_SnippetFromJson(Map json) {
  return _$_Snippet(
    title: json['title'] as String,
    description: json['description'] as String,
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    thumbnails: Thumbnails.fromJson(
        Map<String, dynamic>.from(json['thumbnails'] as Map)),
    localized:
        Localized.fromJson(Map<String, dynamic>.from(json['localized'] as Map)),
    country: json['country'] as String?,
  );
}

Map<String, dynamic> _$_$_SnippetToJson(_$_Snippet instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnails': instance.thumbnails.toJson(),
      'localized': instance.localized.toJson(),
      'country': instance.country,
    };

_$_Localized _$_$_LocalizedFromJson(Map json) {
  return _$_Localized(
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_LocalizedToJson(_$_Localized instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

_$_Thumbnails _$_$_ThumbnailsFromJson(Map json) {
  return _$_Thumbnails(
    thumbnailsDefault: json['thumbnailsDefault'] == null
        ? null
        : Default.fromJson(
            Map<String, dynamic>.from(json['thumbnailsDefault'] as Map)),
    medium: json['medium'] == null
        ? null
        : Default.fromJson(Map<String, dynamic>.from(json['medium'] as Map)),
    high: json['high'] == null
        ? null
        : Default.fromJson(Map<String, dynamic>.from(json['high'] as Map)),
  );
}

Map<String, dynamic> _$_$_ThumbnailsToJson(_$_Thumbnails instance) =>
    <String, dynamic>{
      'thumbnailsDefault': instance.thumbnailsDefault?.toJson(),
      'medium': instance.medium?.toJson(),
      'high': instance.high?.toJson(),
    };

_$_Default _$_$_DefaultFromJson(Map json) {
  return _$_Default(
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$_$_DefaultToJson(_$_Default instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$_Statistics _$_$_StatisticsFromJson(Map json) {
  return _$_Statistics(
    viewCount: json['viewCount'] as String,
    subscriberCount: json['subscriberCount'] as String?,
    hiddenSubscriberCount: json['hiddenSubscriberCount'] as bool,
    videoCount: json['videoCount'] as String,
  );
}

Map<String, dynamic> _$_$_StatisticsToJson(_$_Statistics instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'subscriberCount': instance.subscriberCount,
      'hiddenSubscriberCount': instance.hiddenSubscriberCount,
      'videoCount': instance.videoCount,
    };
