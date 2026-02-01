abstract class AuthRepository {
  Future<void> loginWithEmail({
    required String email,
    required String password,
  });

  Future<void> registerWithEmail({
    required String name,
    required String email,
    required String password,
  });
}
