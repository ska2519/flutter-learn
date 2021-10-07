// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_liked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentLiked _$_$_CommentLikedFromJson(Map json) {
  return _$_CommentLiked(
    userId: json['userId'] as String,
    userDisplayName: json['userDisplayName'] as String,
    commentId: json['commentId'] as String,
    commentUserId: json['commentUserId'] as String,
    commentText: json['commentText'] as String,
    postId: json['postId'] as String,
    postUserId: json['postUserId'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_CommentLikedToJson(_$_CommentLiked instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userDisplayName': instance.userDisplayName,
      'commentId': instance.commentId,
      'commentUserId': instance.commentUserId,
      'commentText': instance.commentText,
      'postId': instance.postId,
      'postUserId': instance.postUserId,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
