import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

abstract class HomeRepository {
  Future<List<Project>> fetchAll({
    String? searchInput,
    int selectedSegment = 0,
    int page = 1,
  });
  Future<String?> archive({required String projectId});
  Future<bool> unarchive({required String archiveId});
  Future<int> unreadNotifications();
}
