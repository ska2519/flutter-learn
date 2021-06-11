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
    print('setData finish');
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    print('addData finish');
    await reference.add(data);
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

  //   Future<void> setTransaction({
  //   required String firstPath,
  //   required String secondPath,
  //   required Map<String, dynamic> data,
  //   bool merge = false,
  // }) async {
  //   final firstTransactionRef = FirebaseFirestore.instance.doc(firstPath);
  //   final secondTransactionRef = FirebaseFirestore.instance.doc(secondPath);
  //   final reference =
  //       FirebaseFirestore.instance.runTransaction((transaction) {
  //         return transaction
  //       .get(firstTransactionRef)
  //       .then((DocumentSnapshot doc) => Restaurant.fromSnapshot(doc))
  //       .then((Restaurant fresh) {}
  //       });

  //   print('setData finish');
  //   await reference.set(data, SetOptions(merge: merge));
  // }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    log('delete: $path');
    await reference.delete();
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
