import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.g.dart';
part 'post.freezed.dart';

@freezed

class Post with _$Post{
  const factory Post({
    String body;
    String author;
    Set usersLiked ={};
    DatabaseReference _id;
  }) = _Post;

    factory Post.fromJson(Map < String, dynamic > json) => _$PostFromJson(json);
}