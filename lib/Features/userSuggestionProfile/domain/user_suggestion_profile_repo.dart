import '../../../Core/Data/Models/project_model.dart';

abstract class UserSuggestionProfileRepo {
  Future<Map<String, dynamic>?> getUserProfile({
    required String userId,
  });

  Future<List<Project>> getUserProjects({
    required String userId,
  });
}
