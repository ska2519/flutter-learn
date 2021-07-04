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
    likedUsers: (json['likedUsers'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toSet() ??
        {},
    level: json['level'] as int? ?? 0,
    parent: json['parent'] as String?,
    private: json['private'] as bool? ?? false,
    childCount: json['childCount'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'postId': instance.postId,
      'userId': instance.userId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'likedUsers': instance.likedUsers.toList(),
      'level': instance.level,
      'parent': instance.parent,
      'private': instance.private,
      'childCount': instance.childCount,
    };
