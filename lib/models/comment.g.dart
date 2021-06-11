// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map json) {
  return _$_Comment(
    text: json['text'] as String,
    postId: json['postId'] as String,
    userId: json['userId'] as String,
    timestamp: (json['timestamp'] as List<dynamic>?)
        ?.map((e) => DateTime.parse(e as String))
        .toSet(),
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'text': instance.text,
      'postId': instance.postId,
      'userId': instance.userId,
      'timestamp': instance.timestamp?.map((e) => e.toIso8601String()).toList(),
    };
