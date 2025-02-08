abstract class SplashRepository {
  Future<dynamic> fetchUserFromLocalCache();
  Future<String?> fetchUserJwtTokenFromLocalCache();
  Future<String?> fetchUserJwtRefreshTokenFromLocalCache();
}
