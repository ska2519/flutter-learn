// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YouTubeVideo _$_$_YouTubeVideoFromJson(Map json) {
  return _$_YouTubeVideo(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$_$_YouTubeVideoToJson(_$_YouTubeVideo instance) =>
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
    contentDetails: ContentDetails.fromJson(
        Map<String, dynamic>.from(json['contentDetails'] as Map)),
    status: Status.fromJson(Map<String, dynamic>.from(json['status'] as Map)),
    statistics: Statistics.fromJson(
        Map<String, dynamic>.from(json['statistics'] as Map)),
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet.toJson(),
      'contentDetails': instance.contentDetails.toJson(),
      'status': instance.status.toJson(),
      'statistics': instance.statistics.toJson(),
    };

_$_ContentDetails _$_$_ContentDetailsFromJson(Map json) {
  return _$_ContentDetails(
    duration: json['duration'] as String,
    dimension: json['dimension'] as String,
    definition: json['definition'] as String,
    caption: json['caption'] as String,
    licensedContent: json['licensedContent'] as bool,
    contentRating: ContentRating.fromJson(
        Map<String, dynamic>.from(json['contentRating'] as Map)),
    projection: json['projection'] as String,
  );
}

Map<String, dynamic> _$_$_ContentDetailsToJson(_$_ContentDetails instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'dimension': instance.dimension,
      'definition': instance.definition,
      'caption': instance.caption,
      'licensedContent': instance.licensedContent,
      'contentRating': instance.contentRating.toJson(),
      'projection': instance.projection,
    };

_$_ContentRating _$_$_ContentRatingFromJson(Map json) {
  return _$_ContentRating();
}

Map<String, dynamic> _$_$_ContentRatingToJson(_$_ContentRating instance) =>
    <String, dynamic>{};

_$_Snippet _$_$_SnippetFromJson(Map json) {
  return _$_Snippet(
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    channelId: json['channelId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    thumbnails: Thumbnails.fromJson(
        Map<String, dynamic>.from(json['thumbnails'] as Map)),
    channelTitle: json['channelTitle'] as String,
    categoryId: json['categoryId'] as String,
    liveBroadcastContent: json['liveBroadcastContent'] as String,
    localized:
        Localized.fromJson(Map<String, dynamic>.from(json['localized'] as Map)),
    defaultAudioLanguage: json['defaultAudioLanguage'] as String?,
  );
}

Map<String, dynamic> _$_$_SnippetToJson(_$_Snippet instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt.toIso8601String(),
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails.toJson(),
      'channelTitle': instance.channelTitle,
      'categoryId': instance.categoryId,
      'liveBroadcastContent': instance.liveBroadcastContent,
      'localized': instance.localized.toJson(),
      'defaultAudioLanguage': instance.defaultAudioLanguage,
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
    standard: json['standard'] == null
        ? null
        : Default.fromJson(Map<String, dynamic>.from(json['standard'] as Map)),
    maxres: json['maxres'] == null
        ? null
        : Default.fromJson(Map<String, dynamic>.from(json['maxres'] as Map)),
  );
}

Map<String, dynamic> _$_$_ThumbnailsToJson(_$_Thumbnails instance) =>
    <String, dynamic>{
      'thumbnailsDefault': instance.thumbnailsDefault?.toJson(),
      'medium': instance.medium?.toJson(),
      'high': instance.high?.toJson(),
      'standard': instance.standard?.toJson(),
      'maxres': instance.maxres?.toJson(),
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
    likeCount: json['likeCount'] as String,
    dislikeCount: json['dislikeCount'] as String,
    favoriteCount: json['favoriteCount'] as String,
    commentCount: json['commentCount'] as String,
  );
}

Map<String, dynamic> _$_$_StatisticsToJson(_$_Statistics instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'favoriteCount': instance.favoriteCount,
      'commentCount': instance.commentCount,
    };

_$_Status _$_$_StatusFromJson(Map json) {
  return _$_Status(
    uploadStatus: json['uploadStatus'] as String,
    privacyStatus: json['privacyStatus'] as String,
    license: json['license'] as String,
    embeddable: json['embeddable'] as bool,
    publicStatsViewable: json['publicStatsViewable'] as bool,
    madeForKids: json['madeForKids'] as bool,
  );
}

Map<String, dynamic> _$_$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'uploadStatus': instance.uploadStatus,
      'privacyStatus': instance.privacyStatus,
      'license': instance.license,
      'embeddable': instance.embeddable,
      'publicStatsViewable': instance.publicStatsViewable,
      'madeForKids': instance.madeForKids,
    };
