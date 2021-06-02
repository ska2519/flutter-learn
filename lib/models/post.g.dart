// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    body: json['body'] as String,
    author: json['author'] as String?,
    usersLiked: (json['usersLiked'] as List<dynamic>?)?.toSet() ?? {},
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'body': instance.body,
      'author': instance.author,
      'usersLiked': instance.usersLiked.toList(),
    };
