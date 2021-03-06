import 'package:algolia/algolia.dart';
import 'package:flutter/foundation.dart';

import '../secret_keys.dart';

class AlgoliaService {
  static const Algolia algolia = Algolia.init(
    applicationId: algoliaApplicationID,
    apiKey: kReleaseMode ? algoliaReleaseApiKey : algoliaDebugApiKey,
  );
}
