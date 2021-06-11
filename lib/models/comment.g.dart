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
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'text': instance.text,
      'postId': instance.postId,
      'userId': instance.userId,
    };
