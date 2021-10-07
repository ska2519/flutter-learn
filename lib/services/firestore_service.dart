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
    Function(T result)? countBiggerThanZero,
  }) async {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) query = queryBuilder(query);

    final QuerySnapshot snapshots = await query.get();

    final result = snapshots.docs
        .map((QueryDocumentSnapshot doc) =>
            builder(doc.data() as Map<String, dynamic>?, doc.id))
        .where((value) => value != null)
        .toList();

    if (sort != null) result.sort(sort);

    if (countBiggerThanZero != null) {
      final countResult = <T>[];
      result.map((e) {
        if (countBiggerThanZero(e) == true) countResult.add(e);
      }).toList();
      return countResult;
    }
    return result;
  }

  Future<void> updateDoc({
    required String path,
    required Map<String, dynamic> data,
  }) async =>
      FirebaseFirestore.instance.doc(path).update(data);

  Future<void> setTransaction({
    required String firstPath,
    required String secondPath,
    Map<String, dynamic>? firstData,
    Map<String, dynamic>? secondData,
    Transaction? action,
  }) async {
    final firstTransactionRef = FirebaseFirestore.instance.doc(firstPath);
    final secondTransactionRef = FirebaseFirestore.instance.doc(secondPath);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(firstTransactionRef, firstData);
      transaction.set(secondTransactionRef, secondData!);
    });
  }

  Future<void> deleteDoc({required String path}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.delete();
  }

  Future<void> deleteCollection({required String path}) async {
    final ref = FirebaseFirestore.instance.collection(path);
    final snapshots = await ref.get();
    for (final doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  Stream<List<T>> collectionGroupStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = FirebaseFirestore.instance.collectionGroup(path);

    if (queryBuilder != null) query = queryBuilder(query);

    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>?, snapshot.id))
          .where((value) => value != null)
          .toList();

      if (sort != null) result.sort(sort);

      return result;
    });
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
    Function(T result)? unOrdDeepEq,
    Function(T result)? containsAll,
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

      if (sort != null) result.sort(sort);

      if (unOrdDeepEq != null) {
        final orderResult = <T>[];
        result.map((e) {
          if (unOrdDeepEq(e) == true) orderResult.add(e);
        }).toList();
        return orderResult;
      }
      if (containsAll != null) {
        final containsResult = <T>[];
        result.map((e) {
          if (containsAll(e) == true) containsResult.add(e);
        }).toList();
        return containsResult;
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
