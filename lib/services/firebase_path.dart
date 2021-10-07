import 'package:flutter_learn/models/comment_liked.dart';

class FirebasePath {
  static String appUser(String id) => 'users/$id';
  static String post(String postId) => 'posts/$postId';
  static String posts() => 'posts';
  static String comment(String postId, String commentId) =>
      '/posts/$postId/comments/$commentId';
  static String comments(String postId) => '/posts/$postId/comments';

  static String collectionGroupComments() => 'comments';
  static String collectionGroupPostLikedUsers() => 'postLiked';
  static String postReadUsers(String postId) => 'posts/$postId/readUsers';
  static String postReadUser(String postId, String userId) =>
      'posts/$postId/readUsers/$userId';
  static String collectionGroupReadUsers() => 'readUsers';

  static String postLiked(String postId) => '/posts/$postId/postLiked';
  static String postLikedUser(String postId, String userId) =>
      'posts/$postId/postLiked/$userId';

  static String commentLiked(String postId, String commentId) =>
      'posts/$postId/comments/$commentId/commentLiked';

  static String commentLikedUser(CommentLiked commentLiked) =>
      'posts/${commentLiked.postId}/comments/${commentLiked.commentId}/commentLiked/${commentLiked.userId}';

  static String tags() => 'tags';
  static String tag(String tag) => 'tags/$tag';
  static String video(String videoId) => 'videos/$videoId';
  static String profileImages(String userId) => 'profileImages/$userId';
  static String tagIcon(String icon) => 'icons/$icon';
  static String tokens(String userId, String token) =>
      'users/$userId/tokens/$token';

  static String chatList() => 'chats';
  static String chat(String chatId) => 'chats/$chatId';
  static String messages(String chatId) => 'chats/$chatId/$chatId';
  static String message(String chatId, String documentID) =>
      'chats/$chatId/$chatId/$documentID';
}
