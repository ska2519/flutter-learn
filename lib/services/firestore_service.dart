import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.set(data, SetOptions(merge: merge));
  }

  Future<DocumentReference<Map<String, dynamic>>> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final ref = FirebaseFirestore.instance.collection(path);
    return ref.add(data);
  }

  Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) async {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final QuerySnapshot snapshots = await query.get();

    final result = snapshots.docs
        .map((QueryDocumentSnapshot doc) =>
            builder(doc.data() as Map<String, dynamic>?, doc.id))
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }

  Future<void> updateDoc({
    required String path,
    required Map<String, dynamic> data,
  }) async =>
      FirebaseFirestore.instance.doc(path).update(data);

  Future<void> setDelTransaction({
    required String deletePath,
    required String updatePath,
    Map<String, dynamic>? deleteData,
    required Map<String, dynamic> updateData,
  }) async {
    final firstTransactionRef = FirebaseFirestore.instance.doc(deletePath);
    final secondTransactionRef = FirebaseFirestore.instance.doc(updatePath);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.delete(firstTransactionRef);
      transaction.update(secondTransactionRef, updateData);
    });
  }

  Future<void> deleteData({required String path}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.delete();
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
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>?, snapshot.id))
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
              builder(snapshot.data() as Map<String, dynamic>?, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Future<T> getDoc<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final DocumentSnapshot snapshot = await reference.get();
    final data = snapshot.data() as Map<String, dynamic>?;
    return builder(data, snapshot.id);
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final ref = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = ref.snapshots();
    return snapshots.map((snapshot) =>
        builder(snapshot.data() as Map<String, dynamic>?, snapshot.id));
  }
}
