abstract class AuthenticationRepository {
  Future<Map<String, dynamic>?> login(
      {required String username, required String password});

  Future<Map<String, dynamic>?> verifyAccount({
    required String email,
    required String code,
  });
}
