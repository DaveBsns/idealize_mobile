abstract class ProfileRepository {
  Future<Map<String, dynamic>?> updateUser(
    Map<String, dynamic> userData,
  );

  Future<void> updateUserInLocalCache(
    Map<String, dynamic> userData,
  );
}
