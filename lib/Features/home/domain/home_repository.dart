import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';

abstract class HomeRepository {
  Future<List<Project>> fetchAll({
    String? searchInput,
    String selectedSegment = 'all-projects',
    int page = 1,
    Tag? filteredByTag,
  });
  Future<String?> archive({required String projectId});
  Future<bool> unarchive({required String archiveId});
  Future<int> unreadNotifications();
}
