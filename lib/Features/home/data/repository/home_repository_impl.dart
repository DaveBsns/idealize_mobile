import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Data/Services/archive_service.dart';
import 'package:idealize_new_version/Core/Data/Services/like_service.dart';
import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import 'package:idealize_new_version/Features/home/domain/home_repository.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../../../Core/Data/Services/notification_service.dart';

class HomeRepositoryImpl extends HomeRepository {
  final projectService = ProjectService();
  final likeService = LikeService();
  final archiveService = ArchiveService();

  @override
  Future<String?> archive({required String projectId}) async =>
      await archiveService.archiveProject(projectId, AppRepo().user!.id);

  @override
  Future<bool> unarchive({required String archiveId}) async =>
      await archiveService.unarchiveProject(archiveId);

  @override
  Future<List<Project>> fetchAll({
    String? searchInput,
    String selectedSegment = 'all-projects',
    int page = 1,
    Tag? filteredByTag,
  }) async {
    return await projectService.fetchAllProject(
      search: searchInput,
      page: page,
      sortField: 'creationDate',
      filter: selectedSegment,
      filterByTag: filteredByTag?.id,
    );
  }

  @override
  Future<int> unreadNotifications() async {
    return await NotificationService().getCountOfUnreadNotifications();
  }

  @override
  Future<bool> like({required String projectId}) async {
    return await likeService.likeProject(projectId, AppRepo().user!.id);
  }

  @override
  Future<bool> unlike({required String projectId}) async {
    return await likeService.unlikeProject(projectId);
  }
}
