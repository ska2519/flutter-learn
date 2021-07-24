import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

//Timestamp _sendAtFromJson(Timestamp timestamp) => timestamp;

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    required String id,
    required String userId,
    required String title,
    required String content,
    @TimestampConverter() DateTime? timestamp,
    @Default(0) int commentCount,
    @Default(0) int likedCount,
    @Default(0) int readCount,
    @Default(false) bool private,
    required String userDisplayName,
    String? userPhotoURL,
    @Default({}) Set<String> tags,
    @Default(false) bool notice,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.random() {
    return _$_Post(
      id: getRandomIds(),
      userId: getRandomUserIds(),
      userDisplayName: getRandomDisplayName(),
      title: getRandomTitle(),
      content: getRandomContent(),
      timestamp: getRandomTimestamp(),
      tags: getRandomTags(),
    );
  }

  factory Post.flutterLearn() {
    const appUserId = 'S6tBjjwNaae1Q6lzeBsxM30Falz1';
    final currentDate = documentIdFromCurrentDate().substring(0, 19);
    final postId = '$currentDate:$appUserId';
    final timestamp = DateTime.now();
    return Post(
      userId: appUserId,
      id: postId,
      timestamp: timestamp,
      title: '플러터 런 소개 - 개발 진행도 75%',
      content:
          'Flutter와 Firebase로 개발 중인 플러터 커뮤니티 앱입니다.완성된 앱은 단일 Dart 코드 베이스에서 Android, iOS 및 웹에서 실행됩니다.Riverpod 상태 관리를 사용하여 서버리스 커뮤니티 앱을 개발합니다.회원 가입 - Firebase AuthenticationDB - Firebase Cloud Firestore이미지 저장 - Firebase Storage백엔드 - Firebase Cloud Functions글 검색 - algolia + Cloud Functions',
      tags: {
        'flutter',
        'dart',
        'firebase',
        'ios',
        'android',
        'web',
      },
      notice: true,
      userDisplayName: 'Ska Lee',
      userPhotoURL:
          'https://lh3.googleusercontent.com/a-/AOh14Ggy81XFuVriQbnrDI6YtvHHmqae47Z5DuWQ_8SVanA=s96-c',
    );
  }
}
