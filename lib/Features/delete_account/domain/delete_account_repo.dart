abstract class DeleteAccountRepo {
  Future<String?> deleteAccountAnanymously();
  Future<dynamic> deleteAccountCompletely();
  Future<bool> veryfyDelete(String code);
  Future<bool> changeProjectOwner(String projectId, String newOwnerId);
}
