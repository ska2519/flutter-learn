import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/test.dart';

import 'mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  test('Read doc on firestore ', () async {
    final reference =
        FirebaseFirestore.instance.doc('users/7ytll7EosoUNI8Ix2hpPf8ZR3rH3');

    reference.get().then((DocumentSnapshot doc) {
      print('doc: $doc');
    });

    print('The doc details are');
  });
}
