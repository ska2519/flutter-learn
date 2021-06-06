import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

//Timestamp _sendAtFromJson(Timestamp timestamp) => timestamp;

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    required String id,
    required String userId,
    required String displayName,
    required String title,
    required String content,
    @TimestampConverter() required DateTime timestamp,
    //required DocumentReference reference,
    @Default({}) Set usersLiked,
    // String? id,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  void likePost(AppUser user) {
    if (usersLiked.contains(user.uid)) {
      usersLiked.remove(user.uid);
    } else {
      usersLiked.add(user.uid);
    }
  }

  // Post.fromUserInput({
  //   required String userId,
  //   required String displayName,
  //   required String title,
  //   required String content,
  // });
  // : id = null,
  //       timestamp = null,
  //       reference = null;

  // factory Post.random({required String displayName, required String userId}) {
  //   final rating = Random().nextInt(4) + 1;
  //   final title = getRandomReviewText(rating);
  //   final content = getRandomReviewText(rating);
  //   return Post(
  //     userId: userId,
  //     displayName: displayName,
  //     title: title,
  //     content: content,
  //     timestamp: DateTime.now(),
  //   );
  // }
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
