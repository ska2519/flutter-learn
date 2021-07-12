class FirestoreApiException implements Exception {
  FirestoreApiException({
    required this.message,
    this.devDetails,
    this.prettyDetails,
  });

  final String message;
  final String? devDetails;
  final String? prettyDetails;

  @override
  String toString() {
    return 'FirestoreApiException: $message ${devDetails ?? ''}';
  }
}
