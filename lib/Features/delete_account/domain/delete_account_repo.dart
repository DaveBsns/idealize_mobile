abstract class DeleteAccountRepo {
  Future<String?> deleteAccountKeepData();
  Future<String?> deleteAccountAnanymously();
  Future<dynamic> deleteAccountCompletely();
  Future<bool> veryfyDelete(
    String code, {
    required bool keepData,
  });
  Future<bool> changeProjectOwner(String projectId, String newOwnerId);
}
