import 'package:idealize_new_version/Core/Data/Services/archive_service.dart';

import '../../../../Core/Data/Models/project_model.dart';
import '../../domain/archived_projcts_repo.dart';

class ArchivedProjctsRepositoryImpl implements ArchivedProjctsRepository {
  @override
  Future<List<Project>> fetchAll() async {
    final response = await ArchiveService().getAllArchives();

    List<Project> archives = [];
    for (final archiveJson in response) {
      if (archiveJson['projectId'] != null) {
        archives.add(Project.fromJson(archiveJson['projectId']));
      }
    }

    return archives;
  }
}
