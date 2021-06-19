// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map json) {
  return _$_Comment(
    id: json['id'] as String?,
    text: json['text'] as String,
    postId: json['postId'] as String,
    userId: json['userId'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    parent: json['parent'] as String?,
    level: json['level'] as int?,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'postId': instance.postId,
      'userId': instance.userId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'parent': instance.parent,
      'level': instance.level,
    };
