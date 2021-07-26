import 'package:hooks_riverpod/hooks_riverpod.dart';

class FcmViewModel extends StateNotifier<String?> {
  FcmViewModel() : super(null);
  // bool isLoading = false;

  void setPageOpenPostId(String? postId) {
    state = postId;
    return;
  }
}
