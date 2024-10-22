abstract class ResetPasswordRepository {
  Future<Map<String, dynamic>?> resetPasswordRequest(String email);
  Future<Map<String, dynamic>?> resetPasswordVerify(
      String email, String code, String newPassword);
}
