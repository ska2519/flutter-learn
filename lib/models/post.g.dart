// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map json) {
  return _$_Post(
    id: json['id'] as String,
    userId: json['userId'] as String,
    displayName: json['displayName'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    commentCount: json['commentCount'] as int? ?? 0,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    usersLiked: (json['usersLiked'] as List<dynamic>?)?.toSet() ?? {},
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'displayName': instance.displayName,
      'title': instance.title,
      'content': instance.content,
      'commentCount': instance.commentCount,
      'timestamp': instance.timestamp?.toIso8601String(),
      'usersLiked': instance.usersLiked.toList(),
    };
