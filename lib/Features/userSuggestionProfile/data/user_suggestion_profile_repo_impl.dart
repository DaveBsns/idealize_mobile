import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import 'package:idealize_new_version/Core/Data/Services/user_service.dart';
import 'package:idealize_new_version/Features/userSuggestionProfile/domain/user_suggestion_profile_repo.dart';

import '../../../Core/Data/Models/project_model.dart';

class UserSuggestionProfileRepoImpl implements UserSuggestionProfileRepo {
  final UserService _userService = UserService();
  final ProjectService _projectService = ProjectService();

  @override
  Future<Map<String, dynamic>?> getUserProfile({required String userId}) async {
    return await _userService.getAnotherUserData(userId);
  }

  @override
  Future<List<Project>> getUserProjects({required String userId}) async {
    return await _projectService.fetchAllProject(
      page: 1,
      limit: 50,
      isDraft: false,
      myProjects: false,
      ownerId: userId,
    );
  }
}
