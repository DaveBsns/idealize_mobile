abstract class ResetPasswordRepository {
  Future<Map<String, dynamic>?> resetPasswordRequest(String email, bool isRecovery);
  Future<Map<String, dynamic>?> resetPasswordVerify(
      String email, String code, String newPassword);
}
