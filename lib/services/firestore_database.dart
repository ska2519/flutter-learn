import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/app_user.dart';
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
              print('appUserStream data: $data');
              return AppUser.fromJson(data!);
            })
        : Stream<AppUser?>.value(null);
  }

  Future<AppUser?> getAppUser(User user) async => _service
      .getDoc(path: FirestorePath.appUser(user.uid))
      .then((appUser) => appUser == null ? null : AppUser.fromJson(appUser));

  Future<void> setAppUser(User user) async => _service.setData(
        path: FirestorePath.appUser(user.uid),
        data: AppUser(
          id: user.uid,
          email: user.email,
          displayName: user.displayName,
          photoURL: user.photoURL,
        ).toJson(),
      );

  Future<void> updateAppUser({
    required AppUser appUser,
  }) async =>
      _service.updateDoc(
        path: FirestorePath.appUser(appUser.id!),
        data: appUser.toJson(),
      );

  Future<void> setPost(Post post) => _service.setData(
        path: FirestorePath.post(post.id),
        data: post.toJson(),
      );

  Stream<List<Post>> postsStream() => _service.collectionStream(
        path: FirestorePath.posts(),
        builder: (data, documentId) => Post.fromJson(data!),
      );
  // Future<void> setJob(Job job) => _service.setData(
  //       path: FirestorePath.job(appUser!.id, job.id),
  //       data: job.toMap(),
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

  // Stream<Job> jobStream({required String jobId}) => _service.documentStream(
  //       path: FirestorePath.job(appUser!.id, jobId),
  //       builder: (data, documentId) => Job.fromMap(data, documentId),
  //     );

  // Stream<List<Job>> jobsStream() => _service.collectionStream(
  //       path: FirestorePath.jobs(appUser!.id),
  //       builder: (data, documentId) => Job.fromMap(data, documentId),
  //     );

  // Future<void> setEntry(Entry entry) => _service.setData(
  //       path: FirestorePath.entry(appUser!.id, entry.id),
  //       data: entry.toMap(),
  //     );

  // Future<void> deleteEntry(Entry entry) =>
  //     _service.deleteData(path: FirestorePath.entry(appUser!.id, entry.id));

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
