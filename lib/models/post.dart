import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'post.g.dart';
part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    required String body,
    String? author,
    @Default({}) Set usersLiked,
    // String? id,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  void likePost(User user) {
    if (usersLiked.contains(user.uid)) {
      usersLiked.remove(user.uid);
    } else {
      usersLiked.add(user.uid);
    }
    //update();
  }
}
