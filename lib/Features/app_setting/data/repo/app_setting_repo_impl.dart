import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Data/Services/user_service.dart';

import '../../domain/app_setting_repo.dart';

class AppSettingRepositoryImpl implements AppSettingRepository {
  final userService = UserService();

  @override
  Future<List<Map<String, dynamic>>> deleteAccount() async {
    final data = await userService.softDeleteUserRequest();

    List<Map<String, dynamic>> projects = [];

    if (data != null) {
      for (final project in data['data']['projects']) {
        projects.add({
          '_id': project['_id'],
          'title': project['title'],
          'members': [
            for (final member in project['teamMembers']) User.fromJson(member)
          ],
        });
      }
    }

    return projects;
  }
}
