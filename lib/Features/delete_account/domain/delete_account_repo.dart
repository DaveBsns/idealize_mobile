abstract class DeleteAccountRepo {
  Future<String?> deleteAccountKeepData({bool useRecoveryEmail = false});
  Future<String?> deleteAccountAnanymously({bool useRecoveryEmail = false});
  Future<dynamic> deleteAccountCompletely({bool useRecoveryEmail = false});
  Future<bool> veryfyDelete(
    String code, {
    required bool keepData,
    bool useRecoveryEmail = false,
  });
  Future<bool> changeProjectOwner(String projectId, String newOwnerId);
}
