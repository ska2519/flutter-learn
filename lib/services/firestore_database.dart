import 'dart:async';

import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/firestore_path.dart';
import 'package:flutter_learn/services/firestore_service.dart';
import 'package:flutter_learn/models/job.dart';
import 'package:flutter_learn/models/entry.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_auth_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

final databaseProvider = Provider<FirestoreDatabase>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  return FirestoreDatabase(appUser: auth.data?.value);
});

class FirestoreDatabase {
  FirestoreDatabase({this.appUser});
  final AppUser? appUser;

  final _service = FirestoreService.instance;

  Future<void> setPost(Post post) => _service.setData(
        path: FirestorePath.post(post.id),
        data: post.toJson(),
      );

  Future<void> setJob(Job job) => _service.setData(
        path: FirestorePath.job(appUser!.uid, job.id),
        data: job.toMap(),
      );

  Future<void> deleteJob(Job job) async {
    // delete where entry.jobId == job.jobId
    final allEntries = await entriesStream(job: job).first;
    for (final entry in allEntries) {
      if (entry.jobId == job.id) {
        await deleteEntry(entry);
      }
    }
    // delete job
    await _service.deleteData(path: FirestorePath.job(appUser!.uid, job.id));
  }

  Stream<Job> jobStream({required String jobId}) => _service.documentStream(
        path: FirestorePath.job(appUser!.uid, jobId),
        builder: (data, documentId) => Job.fromMap(data, documentId),
      );

  Stream<List<Post>> postsStream() => _service.collectionStream(
        path: FirestorePath.posts(),
        builder: (data, documentId) => Post.fromJson(data!),
      );

  Stream<List<Job>> jobsStream() => _service.collectionStream(
        path: FirestorePath.jobs(appUser!.uid),
        builder: (data, documentId) => Job.fromMap(data, documentId),
      );

  Future<void> setEntry(Entry entry) => _service.setData(
        path: FirestorePath.entry(appUser!.uid, entry.id),
        data: entry.toMap(),
      );

  Future<void> deleteEntry(Entry entry) =>
      _service.deleteData(path: FirestorePath.entry(appUser!.uid, entry.id));

  Stream<List<Entry>> entriesStream({Job? job}) =>
      _service.collectionStream<Entry>(
        path: FirestorePath.entries(appUser!.uid),
        queryBuilder: job != null
            ? (query) => query.where('jobId', isEqualTo: job.id)
            : null,
        builder: (data, documentID) => Entry.fromMap(data, documentID),
        sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
      );
}
