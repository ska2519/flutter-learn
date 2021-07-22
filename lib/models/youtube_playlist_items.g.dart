// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_playlist_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaylistItems _$_$_PlaylistItemsFromJson(Map json) {
  return _$_PlaylistItems(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String?,
    prevPageToken: json['prevPageToken'] as String?,
    items: (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
    pageInfo:
        PageInfo.fromJson(Map<String, dynamic>.from(json['pageInfo'] as Map)),
  );
}

Map<String, dynamic> _$_$_PlaylistItemsToJson(_$_PlaylistItems instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
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
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet.toJson(),
      'contentDetails': instance.contentDetails.toJson(),
      'status': instance.status.toJson(),
    };

_$_ContentDetails _$_$_ContentDetailsFromJson(Map json) {
  return _$_ContentDetails(
    videoId: json['videoId'] as String,
    videoPublishedAt: json['videoPublishedAt'] == null
        ? null
        : DateTime.parse(json['videoPublishedAt'] as String),
  );
}

Map<String, dynamic> _$_$_ContentDetailsToJson(_$_ContentDetails instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'videoPublishedAt': instance.videoPublishedAt?.toIso8601String(),
    };

_$_Snippet _$_$_SnippetFromJson(Map json) {
  return _$_Snippet(
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    channelId: json['channelId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    thumbnails: Thumbnails.fromJson(
        Map<String, dynamic>.from(json['thumbnails'] as Map)),
    channelTitle: json['channelTitle'] as String,
    playlistId: json['playlistId'] as String,
    position: json['position'] as int,
    resourceId: ResourceId.fromJson(
        Map<String, dynamic>.from(json['resourceId'] as Map)),
    videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as String?,
    videoOwnerChannelId: json['videoOwnerChannelId'] as String?,
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
      'playlistId': instance.playlistId,
      'position': instance.position,
      'resourceId': instance.resourceId.toJson(),
      'videoOwnerChannelTitle': instance.videoOwnerChannelTitle,
      'videoOwnerChannelId': instance.videoOwnerChannelId,
    };

_$_ResourceId _$_$_ResourceIdFromJson(Map json) {
  return _$_ResourceId(
    kind: json['kind'] as String,
    videoId: json['videoId'] as String,
  );
}

Map<String, dynamic> _$_$_ResourceIdToJson(_$_ResourceId instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'videoId': instance.videoId,
    };

_$_Thumbnails _$_$_ThumbnailsFromJson(Map json) {
  return _$_Thumbnails(
    dflt: json['default'] == null
        ? null
        : Thumbnail.fromJson(Map<String, dynamic>.from(json['default'] as Map)),
    medium: json['medium'] == null
        ? null
        : Thumbnail.fromJson(Map<String, dynamic>.from(json['medium'] as Map)),
    high: json['high'] == null
        ? null
        : Thumbnail.fromJson(Map<String, dynamic>.from(json['high'] as Map)),
    standard: json['standard'] == null
        ? null
        : Thumbnail.fromJson(
            Map<String, dynamic>.from(json['standard'] as Map)),
    maxres: json['maxres'] == null
        ? null
        : Thumbnail.fromJson(Map<String, dynamic>.from(json['maxres'] as Map)),
  );
}

Map<String, dynamic> _$_$_ThumbnailsToJson(_$_Thumbnails instance) =>
    <String, dynamic>{
      'default': instance.dflt?.toJson(),
      'medium': instance.medium?.toJson(),
      'high': instance.high?.toJson(),
      'standard': instance.standard?.toJson(),
      'maxres': instance.maxres?.toJson(),
    };

_$_Thumbnail _$_$_ThumbnailFromJson(Map json) {
  return _$_Thumbnail(
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$_$_ThumbnailToJson(_$_Thumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$_Status _$_$_StatusFromJson(Map json) {
  return _$_Status(
    privacyStatus: json['privacyStatus'] as String,
  );
}

Map<String, dynamic> _$_$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'privacyStatus': instance.privacyStatus,
    };

_$_PageInfo _$_$_PageInfoFromJson(Map json) {
  return _$_PageInfo(
    totalResults: json['totalResults'] as int,
    resultsPerPage: json['resultsPerPage'] as int,
  );
}

Map<String, dynamic> _$_$_PageInfoToJson(_$_PageInfo instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'resultsPerPage': instance.resultsPerPage,
    };
