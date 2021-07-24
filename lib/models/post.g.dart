// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map json) {
  return _$_Post(
    id: json['id'] as String,
    userId: json['userId'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    commentCount: json['commentCount'] as int? ?? 0,
    likedCount: json['likedCount'] as int? ?? 0,
    readCount: json['readCount'] as int? ?? 0,
    private: json['private'] as bool? ?? false,
    userDisplayName: json['userDisplayName'] as String,
    userPhotoURL: json['userPhotoURL'] as String?,
    tags:
        (json['tags'] as List<dynamic>?)?.map((e) => e as String).toSet() ?? {},
    notice: json['notice'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'timestamp': instance.timestamp?.toIso8601String(),
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'readCount': instance.readCount,
      'private': instance.private,
      'userDisplayName': instance.userDisplayName,
      'userPhotoURL': instance.userPhotoURL,
      'tags': instance.tags.toList(),
      'notice': instance.notice,
    };
