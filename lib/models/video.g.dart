// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Video _$_$_VideoFromJson(Map json) {
  return _$_Video(
    id: json['id'] as String,
    title: json['title'] as String,
    thumbnail: json['thumbnail'] as String,
    channelTitle: json['channelTitle'] as String,
    channelUrl: json['channelUrl'] as String,
    channelThumbnail: json['channelThumbnail'] as String,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toSet(),
    level: json['level'] as int? ?? 0,
    likedCount: json['likedCount'] as int? ?? 0,
    watchCount: json['watchCount'] as int? ?? 0,
    commentCount: json['commentCount'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_VideoToJson(_$_Video instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'channelTitle': instance.channelTitle,
      'channelUrl': instance.channelUrl,
      'channelThumbnail': instance.channelThumbnail,
      'tags': instance.tags.toList(),
      'level': instance.level,
      'likedCount': instance.likedCount,
      'watchCount': instance.watchCount,
      'commentCount': instance.commentCount,
    };
