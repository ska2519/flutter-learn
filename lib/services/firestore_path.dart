class FirestorePath {
  static String appUser(String id) => 'users/$id';
  static String post(String postId) => 'posts/$postId';
  static String posts() => 'posts';
  static String comment(String postId, String commentId) =>
      '/posts/$postId/comments/$commentId';
  static String comments(String postId) => '/posts/$postId/comments';
  static String postLiked(String postId) => '/posts/$postId/likedUsers';
  static String collectionGroupComments() => 'comments';

  static String postReadUsers(String postId) => 'posts/$postId/readUsers';
  static String postReadUser(String postId, String userId) =>
      'posts/$postId/readUsers/$userId';
  static String collectionGroupReadUsers() => 'readUsers';
  static String postLikedUsers(String postId) => 'posts/$postId/likedUsers';
  static String postLikedUser(String postId, String userId) =>
      'posts/$postId/likedUsers/$userId';
  static String collectionGroupLikedUsers() => 'likedUsers';
}
