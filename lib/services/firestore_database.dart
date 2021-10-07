import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/app/home/community/posts_page.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/chat.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/comment_liked.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/post_liked.dart';
import 'package:flutter_learn/models/read_post.dart';
import 'package:flutter_learn/models/tag.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:flutter_learn/models/video.dart';
import 'package:flutter_learn/services/firebase_path.dart';
import 'package:flutter_learn/services/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

final databaseProvider = Provider<FirestoreDatabase>((ref) {
  return FirestoreDatabase();
});

class FirestoreDatabase {
  final _service = FirestoreService.instance;

  final Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
  bool containsAll(Set<String> e, Set<String> tags) => e.containsAll(tags);
  bool countBiggerThanZero(Post post, StateController<sortType> filter) {
    switch (filter.state) {
      case sortType.likedCount:
        return post.likedCount > 0;
      case sortType.commentCount:
        return post.commentCount > 0;
      case sortType.readCount:
        return post.readCount > 0;
    }
  }

  Stream<AppUser?> appUserStream(User? user) => user != null
      ? _service.documentStream(
          path: FirebasePath.appUser(user.uid),
          builder: (data, documentId) =>
              data == null ? null : AppUser.fromJson(data),
        )
      : Stream<AppUser?>.empty();

  Future<AppUser?> getAppUser(String? uid) async => uid == null
      ? null
      : _service.getDoc(
          path: FirebasePath.appUser(uid),
          builder: (data, documentId) =>
              data == null ? null : AppUser.fromJson(data));

  Future<void> deleteAppUser(String uid) =>
      _service.deleteDoc(path: FirebasePath.appUser(uid));

  Future<void> setAppUser(User user) async => _service.setData(
      path: FirebasePath.appUser(user.uid),
      data: AppUser(
        id: user.uid,
        email: user.email!,
        displayName: user.displayName ?? SuperHero.random(),
        photoURL: user.photoURL,
        timestamp: DateTime.now(),
      ).toJson());

  Future<Post?> getPost(String postId) async => _service.getDoc(
      path: FirebasePath.post(postId),
      builder: (data, documentId) => data == null ? null : Post.fromJson(data));

  Future<void> updateAppUser(AppUser appUser) async => _service.updateDoc(
      path: FirebasePath.appUser(appUser.id), data: appUser.toJson());

  Future<void> setPost(Post post) =>
      _service.setData(path: FirebasePath.post(post.id), data: post.toJson());

  Future<void> updatePost(Post post) =>
      _service.updateDoc(path: FirebasePath.post(post.id), data: post.toJson());

  Future<void> deletePost(String postId) =>
      _service.deleteDoc(path: FirebasePath.post(postId));

  Future<void> setComment(Comment comment) => _service.setData(
      path: FirebasePath.comment(comment.postId, comment.id),
      data: comment.toJson());

  Future<void> updateComment(Comment comment) => _service.updateDoc(
      path: FirebasePath.comment(comment.postId, comment.id),
      data: comment.toJson());

  Future<void> deleteComment(Comment comment) => _service.deleteDoc(
      path: FirebasePath.comment(comment.postId, comment.id));

  Future<void> setReadUser(ReadPost readPost) async => _service.setData(
      path: FirebasePath.postReadUser(readPost.postId, readPost.userId),
      data: readPost.toJson());

  Future<void> setPostLiked(PostLiked likedPost) async => _service.setData(
      path: FirebasePath.postLikedUser(likedPost.postId, likedPost.userId),
      data: likedPost.toJson());

  Future<void> deletePostLiked(String userId, Post post) =>
      _service.deleteDoc(path: FirebasePath.postLikedUser(post.id, userId));

  Future<void> setCommentLiked(CommentLiked commentLiked) async =>
      _service.setData(
          path: FirebasePath.commentLikedUser(commentLiked),
          data: commentLiked.toJson());

  Future<void> deleteCommentLiked(CommentLiked commentLiked) =>
      _service.deleteDoc(path: FirebasePath.commentLikedUser(commentLiked));

  Future<List<String>> getPostReadUsers(String postId) async =>
      _service.getCollection(
          path: FirebasePath.postReadUsers(postId),
          builder: (data, documentId) => documentId);

  Future<List<Tag>> getTags() async => _service.getCollection(
      path: FirebasePath.tags(),
      builder: (data, documentId) => Tag.fromJson(data!));

  Future<void> updateTag(Tag tag) async =>
      _service.updateDoc(path: FirebasePath.tag(tag.name), data: tag.toJson());

  Future<List<Post>> getPosts({
    required String startDay,
    required StateController<sortType> filter,
  }) {
    return _service.getCollection(
      path: FirebasePath.posts(),
      builder: (data, documentID) => Post.fromJson(data!),
      queryBuilder: (query) => query.where(
        'timestamp',
        isGreaterThanOrEqualTo: startDay,
      ),
      sort: (lhs, rhs) => filter.state == sortType.likedCount
          ? rhs.likedCount.compareTo(lhs.likedCount)
          : filter.state == sortType.commentCount
              ? rhs.commentCount.compareTo(lhs.commentCount)
              : rhs.readCount.compareTo(lhs.readCount),
      countBiggerThanZero: (post) => countBiggerThanZero(post, filter),
    );
  }

  Stream<List<Post?>> postsStream({required Set<String> tags}) =>
      _service.collectionStream(
        path: FirebasePath.posts(),
        queryBuilder: (query) => query.orderBy('timestamp', descending: true),
        builder: (data, documentId) =>
            data != null ? Post.fromJson(data) : null,
        containsAll: tags.isNotEmpty
            ? (Post? post) => containsAll(post!.tags.toSet(), tags)
            : null,
        // unOrdDeepEq:
        //     tags != null ? (Post? lhs) => unOrdDeepEq(lhs?.tags, tags) : null,
      );

  Stream<Post> postStream(String postId) => _service.documentStream(
      path: FirebasePath.post(postId),
      builder: (data, documentId) => Post.fromJson(data!));

  Stream<List<Comment>> topLevelCommentsStream(String postId) =>
      _service.collectionStream<Comment>(
        path: FirebasePath.comments(postId),
        queryBuilder: (query) => query.where('level', isEqualTo: 0),
        builder: (data, documentId) => Comment.fromJson(data!),
        sort: (lhs, rhs) => rhs.timestamp!.compareTo(lhs.timestamp!),
      );

  /// 1단계 하위 레벨만 isLessThanOrEqualTo로 솔팅 가능
  Stream<List<Comment>> childCommentsStream(Comment comment) =>
      _service.collectionStream<Comment>(
        path: FirebasePath.comments(comment.postId),
        queryBuilder: (query) => query
            .where('parentCmt', isGreaterThanOrEqualTo: comment.id)
            .where('parentCmt', isLessThanOrEqualTo: '${comment.id}~'),
        builder: (data, documentId) => Comment.fromJson(data!),
        sort: (lhs, rhs) => rhs.timestamp!.compareTo(lhs.timestamp!),
        // sort: (lhs, rhs) => lhs.level!.compareTo(rhs.level!),
      );

  Stream<List<PostLiked>> postLikedStream(String postId) =>
      _service.collectionStream<PostLiked>(
        path: FirebasePath.postLiked(postId),
        queryBuilder: (query) => query.orderBy('timestamp', descending: true),
        builder: (data, documentId) => PostLiked.fromJson(data!),
      );

  Stream<List<Post>> userPostsStream(String userId) =>
      _service.collectionStream<Post>(
        path: FirebasePath.posts(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => Post.fromJson(data!),
      );
  Stream<List<Comment>> userCommentsStream(String? userId) =>
      _service.collectionGroupStream<Comment>(
        path: FirebasePath.collectionGroupComments(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => Comment.fromJson(data!),
      );
  Stream<List<PostLiked>> userLikedPostsStream(String? userId) =>
      _service.collectionGroupStream<PostLiked>(
        path: FirebasePath.collectionGroupPostLikedUsers(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => PostLiked.fromJson(data!),
        // sort: (lhs, rhs) => rhs.timestamp!.compareTo(lhs.timestamp!),
      );
  Stream<List<ReadPost>> userReadPostsStream(String? userId) =>
      _service.collectionGroupStream<ReadPost>(
        path: FirebasePath.collectionGroupReadUsers(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => ReadPost.fromJson(data!),
      );
  Future<void> setVideo(Video video) {
    return _service.setData(
      path: FirebasePath.video(video.id),
      data: video.toJson(),
    );
  }

  Future<Video?> getVideo(String videoId) async => _service.getDoc(
        path: FirebasePath.video(videoId),
        builder: (data, documentId) =>
            data != null ? Video.fromJson(data) : null,
      );

  Future<void> setToken(String userId, String token) async =>
      _service.setData(path: FirebasePath.tokens(userId, token), data: {
        'token': token,
        'createdAt': FieldValue.serverTimestamp(),
        'platform': Platform.operatingSystem,
      });

  Stream<List<CommentLiked>> commentLikedStream(Comment comment) =>
      _service.collectionStream<CommentLiked>(
        path: FirebasePath.commentLiked(comment.postId, comment.id),
        queryBuilder: (query) => query.orderBy('timestamp', descending: true),
        builder: (data, documentId) => CommentLiked.fromJson(data!),
      );

  Stream<List<Chat>?> chatListStream(String userId) =>
      _service.collectionStream(
        path: FirebasePath.chatList(),
        builder: (data, documentID) => Chat.fromJson(data!),
        queryBuilder: (query) => query
            .orderBy('lastMessage.timestamp', descending: true)
            .where('userIds', arrayContains: userId),
      );

  // Stream<List<AppUser>> getUsersByList(List<String> userIds) {
  //   final List<Stream<AppUser>> streams = [];
  //   for (final id in userIds) {
  //     streams.add(_service.documentStream(
  //       path: FirebasePath.appUser(id),
  //       builder: (data, documentID) => AppUser.fromJson(data!),
  //     ));
  //   }
  //   return StreamZip<AppUser>(streams).asBroadcastStream();
  // }
  Future<List<AppUser>> getUsersByList(List<String> userIds) async {
    final List<AppUser> chatUsers = [];
    for (final id in userIds) {
      chatUsers.add(
        await _service.getDoc(
          path: FirebasePath.appUser(id),
          builder: (data, documentID) => AppUser.fromJson(data!),
        ),
      );
    }
    return chatUsers;
  }

  Future<void> setChat(Chat chat) async => _service.setData(
      path: FirebasePath.chat(chat.id),
      data: chat.copyWith(lastMessage: chat.lastMessage).toJson());

  Future<void> addMessage(Chat chat) async => _service.addData(
      path: FirebasePath.messages(chat.id), data: chat.lastMessage.toJson());

  Stream<List<Message>> messagesStream(String chatId) =>
      _service.collectionStream(
          path: FirebasePath.messages(chatId),
          builder: (data, documentID) {
            data!.addAll({'documentID': documentID});
            return Message.fromJson(data);
          },
          queryBuilder: (query) =>
              query.orderBy('timestamp', descending: true));

  Future<void> deleteChat(Chat chat) async {
    await _service.deleteCollection(path: FirebasePath.messages(chat.id));
    _service.deleteDoc(path: FirebasePath.chat(chat.id));
  }

  void updateMessageRead(Message message, String chatId) => _service.setData(
        path: FirebasePath.message(chatId, message.documentID!),
        data: {'read': true},
        merge: true,
      );
}
