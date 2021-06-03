import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    required String postId,
    required String author,
    required String title,
    required String content,
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
    //update();
  }

  // void update() {
  //   setPost(postId);
  // }
}
