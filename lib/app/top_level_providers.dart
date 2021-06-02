import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<FirestoreDatabase>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  if (auth.data?.value != null) {
    return FirestoreDatabase(appUser: auth.data!.value!);
  }
  throw UnimplementedError();
});
