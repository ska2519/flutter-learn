class AppUser {
  const AppUser({
    required this.uid,
    this.email,
    this.photoURL,
    this.displayName,
  });

  final String uid;
  final String? email;
  final String? photoURL;
  final String? displayName;
}
