import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import 'package:idealize_new_version/Core/Data/Services/user_service.dart';
import 'package:idealize_new_version/Features/delete_account/domain/delete_account_repo.dart';

class DeleteAccountRepoImpl implements DeleteAccountRepo {
  final service = UserService();
  final pService = ProjectService();

  @override
  Future<String?> deleteAccountAnanymously() async {
    final res = await service.softAnanymizedDeleteUserRequest();
    if (res != null) {
      if (res['message'] == 'otp_sent_success') {
        return res['message'];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<String?> deleteAccountKeepData() async {
    final res = await service.softKeepDataDeleteUserRequest();
    if (res != null) {
      if (res['message'] == 'otp_sent_success') {
        return res['message'];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<dynamic> deleteAccountCompletely() async {
    await Future.delayed(const Duration(seconds: 2));
    final res = await service.softDeleteUserRequest();
    if (res != null) {
      if (res['message'] == 'soft_delete_projects_exists') {
        List<Map<String, dynamic>> projects = [];

        for (final project in res['data']['projects']) {
          projects.add({
            '_id': project['_id'],
            'title': project['title'],
            'members': [
              for (final member in project['teamMembers']) User.fromJson(member)
            ],
          });
        }

        return projects;
      } else if (res['message'] == 'otp_sent_success') {
        return 'otp_sent_success';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<bool> veryfyDelete(
    String code, {
    required bool keepData,
  }) async {
    final res = await service.verifyDelete(code, keepData: keepData);
    if (res != null) {
      if (res['message'] == 'user_deleted_success') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<bool> changeProjectOwner(String projectId, String newOwnerId) async {
    return await pService.changeOwner(projectId, newOwnerId);
  }
}
