import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/services/firestore_path.dart';
import 'package:flutter_learn/services/firestore_service.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

final databaseProvider = Provider<FirestoreDatabase>((ref) {
  return FirestoreDatabase();
});

class FirestoreDatabase {
  final _service = FirestoreService.instance;

  Stream<AppUser?> appUserStream(AppUser appUser) {
    return appUser.id != null
        ? _service.documentStream(
            path: FirestorePath.appUser(appUser.id!),
            builder: (data, documentId) {
              return AppUser.fromJson(data!);
            })
        : Stream<AppUser?>.value(null);
  }

  Future<AppUser?> getAppUser(String uid) async => _service
      .getDoc(path: FirestorePath.appUser(uid))
      .then((appUser) => appUser == null ? null : AppUser.fromJson(appUser));

  Future<Post?> getPost(String postId) async => _service
      .getDoc(path: FirestorePath.post(postId))
      .then((post) => post == null ? null : Post.fromJson(post));

  Future<void> setAppUser(User user) async => _service.setData(
        path: FirestorePath.appUser(user.uid),
        data: AppUser(
          id: user.uid,
          email: user.email,
          displayName: user.displayName,
          photoURL: user.photoURL,
          timestamp: <DateTime>{},
        ).toJson(),
      );

  Future<void> updateAppUser(AppUser appUser) async => _service.updateDoc(
        path: FirestorePath.appUser(appUser.id!),
        data: appUser.toJson(),
      );

  Future<void> setPost(Post post) => _service.setData(
        path: FirestorePath.post(post.id),
        data: post.toJson(),
      );

  Future<void> updatePost(Post post) => _service.setData(
        path: FirestorePath.post(post.id),
        data: post.toJson(),
        merge: true,
      );

  Future<DocumentReference<Map<String, dynamic>>> setComment(Comment comment) =>
      _service.addData(
        path: FirestorePath.comments(comment.postId),
        data: comment.toJson(),
      );

  Future<void> updateComment(Comment comment) => _service.updateDoc(
        path: FirestorePath.comment(comment.postId, comment.id!),
        data: comment.toJson(),
      );
  Future<void> transactionComment(Comment comment, Post post) =>
      _service.setTransaction(
        firstPath: FirestorePath.comment(comment.postId, comment.id!),
        secondPath: FirestorePath.post(comment.postId),
        firstData: comment.toJson(),
        secondData: post.toJson(),
      );
  Future<void> deleteComment(Comment comment) => _service.deleteData(
      path: FirestorePath.comment(comment.postId, comment.id!));

  Future<void> deletePost(String postId) =>
      _service.deleteData(path: FirestorePath.post(postId));

  Stream<List<Post>> postsStream() => _service.collectionStream(
        path: FirestorePath.posts(),
        queryBuilder: (query) => query.orderBy('timestamp', descending: true),
        builder: (data, documentId) => Post.fromJson(data!),
      );
  Stream<Post> postStream(String postId) => _service.documentStream(
        path: FirestorePath.post(postId),
        builder: (data, documentId) => Post.fromJson(data!),
      );
  Stream<List<Comment>> commentsStream(Post post) =>
      _service.collectionStream<Comment>(
        path: FirestorePath.comments(post.id),
        queryBuilder: (query) => query
            .where('postId', isEqualTo: post.id)
            // .orderBy('timestamp', descending: true)
            .limit(20),
        builder: (data, documentId) => Comment.fromJson(data!),
      );

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

  // Stream<Job> jobStream({required String jobId}) => _service.documentStream(
  //       path: FirestorePath.job(appUser!.id, jobId),
  //       builder: (data, documentId) => Job.fromMap(data, documentId),
  //     );

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
