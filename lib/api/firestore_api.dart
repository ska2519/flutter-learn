// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_learn/exceptions/firestore_api_exception.dart';
// import 'package:flutter_learn/models/user.dart';

// class FirestoreApi {
//   final CollectionReference usersCollection =
//       FirebaseFirestore.instance.collection('users');
//   Future<void> createUser({required AppUser user}) async {
//     try {
//       final userDocument = usersCollection.doc(user.id);
//       await userDocument.set(user.toJson());
//       print("UserCreate at ${userDocument.path}");
//     } catch (error) {
//       throw FirestoreApiException(
//         message: 'Failed to create new user',
//         devDetails: '$error',
//       );
//     }
//   }
// }
