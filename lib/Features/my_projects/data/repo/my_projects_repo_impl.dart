import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import '../../domain/my_projects_repo.dart';

class MyProjectsRepositoryImpl implements MyProjectsRepository {
  @override
  Future<void> delete(projectId) async {
    await ProjectService().deleteProject(projectId);
  }

  @override
  Future<List<Project>> fetchAll({
    int page = 1,
    String? sortField,
    String? search,
    int? limit,
    bool isDraft = false,
    bool myProjects = false,
  }) async {
    return await ProjectService().fetchAllProject(
      isDraft: isDraft,
      myProjects: myProjects,
      page: page,
      search: search,
      sortField: sortField,
      limit: limit,
    );
  }
}
