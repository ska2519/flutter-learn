import 'package:flutter_learn/services/storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_path.dart';

final storageProvider = Provider<FirestoreStorage>((ref) => FirestoreStorage());

class FirestoreStorage {
  final _storage = StorageService.instance;

  Future<String> profileDownloadURL({required String userId}) async =>
      _storage.downloadURL(path: FirebasePath.profileImages(userId));

  Future<String?> tagDownloadURL({String? tagIcon}) async => tagIcon != null
      ? _storage.downloadURL(path: FirebasePath.tagIcon(tagIcon))
      : null;

  Future<void> uploadProfileImage(
          {required String userId, required String filePath}) async =>
      _storage.uploadFile(
          path: FirebasePath.profileImages(userId), filePath: filePath);
}
