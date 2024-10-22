import '../../../Core/Data/Models/project_model.dart';

abstract class MyProjectsRepository {
  Future<void> delete(projectId);
  Future<List<Project>> fetchAll({
    int page = 1,
    String? sortField,
    String? search,
    int? limit,
    bool isDraft = false,
    bool myProjects = false,
  });
}
