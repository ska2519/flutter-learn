// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_liked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostLiked _$_$_PostLikedFromJson(Map json) {
  return _$_PostLiked(
    postId: json['postId'] as String,
    userId: json['userId'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_PostLikedToJson(_$_PostLiked instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
