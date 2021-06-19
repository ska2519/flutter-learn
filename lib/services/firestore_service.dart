import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<DocumentReference<Map<String, dynamic>>> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    return reference.add(data);
  }

  Future<Map<String, dynamic>?> getDoc({required String path}) =>
      FirebaseFirestore.instance
          .doc(path)
          .get()
          .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>?);

  Future<void> updateDoc({
    required String path,
    required Map<String, dynamic> data,
  }) async =>
      FirebaseFirestore.instance.doc(path).update(data);

  Future<void> setDelTransaction({
    required String firstPath,
    required String secondPath,
    required Map<String, dynamic> firstData,
    required Map<String, dynamic> secondData,
  }) async {
    final firstTransactionRef = FirebaseFirestore.instance.doc(firstPath);
    final secondTransactionRef = FirebaseFirestore.instance.doc(secondPath);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.delete(firstTransactionRef);
      transaction.update(secondTransactionRef, secondData);
    });
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    log('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionGroupStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = FirebaseFirestore.instance.collectionGroup(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }

    final Stream<QuerySnapshot> snapshots = query.snapshots();

    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) {
            print('snapshot: ${snapshot.data().runtimeType}');
            return builder(
                snapshot.data()! as Map<String, dynamic>, snapshot.id);
          })
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data()! as Map<String, dynamic>, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        builder(snapshot.data()! as Map<String, dynamic>, snapshot.id));
  }
}
