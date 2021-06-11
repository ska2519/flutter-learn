class FirestorePath {
  static String job(String uid, String jobId) => 'users/$uid/jobs/$jobId';
  static String jobs(String uid) => 'users/$uid/jobs';
  static String entry(String uid, String entryId) =>
      'users/$uid/entries/$entryId';
  static String entries(String uid) => 'users/$uid/entries';
  static String appUser(String id) => 'users/$id';
  static String post(String id) => 'posts/$id';
  static String posts() => 'posts';
  static String comments() => 'comments';
  static String comment(String postId) => '/posts/$postId/comments';
}
