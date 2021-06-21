// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadPost _$_$_ReadPostFromJson(Map json) {
  return _$_ReadPost(
    postId: json['postId'] as String,
    userId: json['userId'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_ReadPostToJson(_$_ReadPost instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
