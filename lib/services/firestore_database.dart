import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/post_liked.dart';
import 'package:flutter_learn/models/read_post.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:flutter_learn/services/firestore_path.dart';
import 'package:flutter_learn/services/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

final databaseProvider = Provider<FirestoreDatabase>((ref) {
  return FirestoreDatabase();
});

class FirestoreDatabase {
  final _service = FirestoreService.instance;

  Stream<AppUser?> appUserStream(AppUser? appUser) => appUser != null
      ? _service.documentStream(
          path: FirestorePath.appUser(appUser.id!),
          builder: (data, documentId) =>
              data == null ? null : AppUser.fromJson(data))
      : Stream<AppUser?>.empty();

  Future<AppUser?> getAppUser(String? uid) async {
    return uid == null
        ? null
        : _service.getDoc(
            path: FirestorePath.appUser(uid),
            builder: (data, documentId) =>
                data == null ? null : AppUser.fromJson(data));
  }

  Future<void> deleteAppUser(String uid) =>
      _service.deleteData(path: FirestorePath.appUser(uid));

  Future<void> setAppUser(User user) async => _service.setData(
        path: FirestorePath.appUser(user.uid),
        data: AppUser(
          id: user.uid,
          email: user.email,
          displayName: user.displayName ?? SuperHero.random(),
          photoURL: user.photoURL,
          // timestamp: DateTime.now(),
        ).toJson(),
      );
  Future<Post?> getPost(String postId) async => _service.getDoc(
      path: FirestorePath.post(postId),
      builder: (data, documentId) => data == null ? null : Post.fromJson(data));

  Future<void> updateAppUser(AppUser appUser) async => _service.updateDoc(
        path: FirestorePath.appUser(appUser.id!),
        data: appUser.toJson(),
      );

  Future<void> setPost(Post post) {
    return _service.setData(
        path: FirestorePath.post(post.id), data: post.toJson());
  }

  Future<void> updatePost(Post post) => _service.updateDoc(
        path: FirestorePath.post(post.id),
        data: post.toJson(),
      );
  Future<void> setComment(Comment comment) => _service.setData(
        path: FirestorePath.comment(comment.postId, comment.id!),
        data: comment.toJson(),
      );
  Future<DocumentReference<Map<String, dynamic>>> addComment(Comment comment) =>
      _service.addData(
        path: FirestorePath.comments(comment.postId),
        data: comment.toJson(),
      );
  Future<void> setReadUser(ReadPost readPost) async => _service.setData(
        path: FirestorePath.postReadUser(readPost.postId, readPost.userId),
        data: readPost.toJson(),
      );
  Future<void> setPostLiked(PostLiked likedPost) async => _service.setData(
        path: FirestorePath.postLikedUser(likedPost.postId, likedPost.userId),
        data: likedPost.toJson(),
      );

  Future<void> updateComment(Comment comment) => _service.updateDoc(
        path: FirestorePath.comment(comment.postId, comment.id!),
        data: comment.toJson(),
      );
  Future<void> transactionDelComment(Comment comment, Post post) =>
      _service.setDelTransaction(
        deletePath: FirestorePath.comment(comment.postId, comment.id!),
        updatePath: FirestorePath.post(comment.postId),
        updateData: post.toJson(),
      );
  Future<void> transactionDelPostLiked(String userId, Post post) =>
      _service.setDelTransaction(
        deletePath: FirestorePath.postLikedUser(post.id, userId),
        updatePath: FirestorePath.post(post.id),
        updateData: post.toJson(),
      );
  Future<void> deleteComment(Comment comment) => _service.deleteData(
      path: FirestorePath.comment(comment.postId, comment.id!));

  Future<void> deletePost(String postId) =>
      _service.deleteData(path: FirestorePath.post(postId));

  Future<List<String>> getPostReadUsers(String postId) async =>
      _service.getCollection(
          path: FirestorePath.postReadUsers(postId),
          builder: (data, documentId) => documentId);

  // data!['id'] = documentId;
  Stream<List<Post?>> postsStream() => _service.collectionStream(
      path: FirestorePath.posts(),
      queryBuilder: (query) => query.orderBy('timestamp', descending: true),
      builder: (data, documentId) => data != null ? Post.fromJson(data) : null);

  Stream<Post> postStream(String postId) => _service.documentStream(
      path: FirestorePath.post(postId),
      builder: (data, documentId) => Post.fromJson(data!));

  Stream<List<Comment>> topLevelCommentsStream(String postId) =>
      _service.collectionStream<Comment>(
        path: FirestorePath.comments(postId),
        queryBuilder: (query) => query.where('level', isEqualTo: 0),
        builder: (data, documentId) => Comment.fromJson(data!),
        sort: (lhs, rhs) => rhs.timestamp!.compareTo(lhs.timestamp!),
      );

  /// 1단계 하위 레벨만 isLessThanOrEqualTo로 솔팅 가능
  Stream<List<Comment>> childCommentsStream(Comment comment) =>
      _service.collectionStream<Comment>(
        path: FirestorePath.comments(comment.postId),
        queryBuilder: (query) => query
            .where('parent', isGreaterThanOrEqualTo: comment.id)
            .where('parent', isLessThanOrEqualTo: '${comment.id}~'),
        builder: (data, documentId) => Comment.fromJson(data!),
        sort: (lhs, rhs) => rhs.timestamp!.compareTo(lhs.timestamp!),
        // sort: (lhs, rhs) => lhs.level!.compareTo(rhs.level!),
      );

  Stream<List<PostLiked>> postLikedStream(String postId) =>
      _service.collectionStream<PostLiked>(
        path: FirestorePath.postLiked(postId),
        queryBuilder: (query) => query.orderBy('timestamp', descending: true),
        builder: (data, documentId) => PostLiked.fromJson(data!),
      );
  Stream<List<Post>> userPostsStream(String userId) =>
      _service.collectionStream<Post>(
        path: FirestorePath.posts(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => Post.fromJson(data!),
      );
  Stream<List<Comment>> userCommentsStream(String? userId) =>
      _service.collectionGroupStream<Comment>(
        path: FirestorePath.collectionGroupComments(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => Comment.fromJson(data!),
      );
  Stream<List<PostLiked>> userLikedPostsStream(String? userId) =>
      _service.collectionGroupStream<PostLiked>(
        path: FirestorePath.collectionGroupLikedUsers(),
        queryBuilder: (query) => query.where('userId', isEqualTo: userId),
        builder: (data, documentId) => PostLiked.fromJson(data!),
        sort: (lhs, rhs) => rhs.timestamp!.compareTo(lhs.timestamp!),
      );
  Stream<List<ReadPost>> userReadPostsStream(String? userId) =>
      _service.collectionGroupStream<ReadPost>(
        path: FirestorePath.collectionGroupReadUsers(),
        queryBuilder: (query) => query
            .where('userId', isEqualTo: userId)
            .orderBy('timestamp', descending: true),
        builder: (data, documentId) => ReadPost.fromJson(data!),
      );

  // Future<List<String>> getPostLikedUsers(String postId) async =>
  //     _service.getCollection(
  //       path: FirestorePath.postLikedUsers(postId),
  //       builder: (data, documentId) {
  //         print('data: $data / documentId: $documentId');
  //         return documentId;
  //       },
  //     );

  // Future<void> deleteJob(Job job) async {
  //   // delete where entry.jobId == job.jobId
  //   final allEntries = await entriesStream(job: job).first;
  //   for (final entry in allEntries) {
  //     if (entry.jobId == job.id) {
  //       await deleteEntry(entry);
  //     }
  //   }
  //   // delete job
  //   await _service.deleteData(path: FirestorePath.job(appUser!.id, job.id));
  // }

  // Stream<List<Entry>> entriesStream({Job? job}) =>
  //     _service.collectionStream<Entry>(
  //       path: FirestorePath.entries(appUser!.id),
  //       queryBuilder: job != null
  //           ? (query) => query.where('jobId', isEqualTo: job.id)
  //           : null,
  //       builder: (data, documentID) => Entry.fromMap(data, documentID),
  //       sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
  //     );
}
