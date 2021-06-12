import 'package:flutter_learn/models/timestamp_converter.dart';
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
    //@Default(<DateTime>{})
    @TimestampConverter() Set<DateTime>? timestamp,
    //required DocumentReference reference,
    @Default({}) Set usersLiked,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  void likePost(AppUser appUser) {
    if (usersLiked.contains(appUser.id)) {
      usersLiked.remove(appUser.id);
    } else {
      usersLiked.add(appUser.id);
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
