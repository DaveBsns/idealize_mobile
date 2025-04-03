import 'package:idealize_new_version/Core/Data/Services/archive_service.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../../../Core/Data/Models/project_model.dart';
import '../../domain/archived_projcts_repo.dart';

class ArchivedProjctsRepositoryImpl implements ArchivedProjctsRepository {
  final archiveService = ArchiveService();

  @override
  Future<String?> archive({
    required String projectId,
    required String projectOwnerId,
  }) async =>
      await archiveService.archiveProject(
        projectId,
        AppRepo().user!.id,
        projectOwnerId,
      );

  @override
  Future<bool> unarchive({required String archiveId}) async =>
      await archiveService.unarchiveProject(archiveId);

  @override
  Future<List<Project>> fetchAll() async {
    final response = await ArchiveService().getAllArchives();

    List<Project> archives = [];
    for (final archiveJson in response) {
      if (archiveJson['projectId'] != null) {
        final project = Project.fromJson(archiveJson['projectId']);
        project.archiveId = archiveJson['_id'];
        archives.add(project);
      }
    }

    return archives;
  }
}
