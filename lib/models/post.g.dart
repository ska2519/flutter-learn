// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    postId: json['postId'] as String,
    author: json['author'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    usersLiked: (json['usersLiked'] as List<dynamic>?)?.toSet() ?? {},
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'author': instance.author,
      'title': instance.title,
      'content': instance.content,
      'usersLiked': instance.usersLiked.toList(),
    };