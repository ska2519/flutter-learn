// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map json) {
  return _$_Comment(
    id: json['id'] as String,
    text: json['text'] as String,
    postId: json['postId'] as String,
    postTitle: json['postTitle'] as String,
    userId: json['userId'] as String,
    userDisplayName: json['userDisplayName'] as String,
    userPhotoURL: json['userPhotoURL'] as String?,
    postUserId: json['postUserId'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    likedCount: json['likedCount'] as int? ?? 0,
    level: json['level'] as int? ?? 0,
    parentCmt: json['parentCmt'] as String?,
    parentCmtUserId: json['parentCmtUserId'] as String?,
    parentCmtText: json['parentCmtText'] as String?,
    private: json['private'] as bool? ?? false,
    childCount: json['childCount'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'postId': instance.postId,
      'postTitle': instance.postTitle,
      'userId': instance.userId,
      'userDisplayName': instance.userDisplayName,
      'userPhotoURL': instance.userPhotoURL,
      'postUserId': instance.postUserId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'likedCount': instance.likedCount,
      'level': instance.level,
      'parentCmt': instance.parentCmt,
      'parentCmtUserId': instance.parentCmtUserId,
      'parentCmtText': instance.parentCmtText,
      'private': instance.private,
      'childCount': instance.childCount,
    };
