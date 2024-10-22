import 'package:http_parser/http_parser.dart' as http_parser;

import '../../../Core/Data/Models/link_model.dart';
import '../../../Core/Data/Models/project_model.dart';

abstract class CreateNewProjectRepository {
  Future<void> deleteProject(
    String projectId,
  );

  Future<bool> deleteMaterials(
    String attachementId,
  );

  Future<ProjectFile?> uploadFile(
    String path,
    http_parser.MediaType mediaType,
  );

  Future<void> createNew({
    required String title,
    required String description,
    List<String> tags = const [],
    bool isDraft = false,
    List<String> attachments = const [],
    List<String> courses = const [],
    List<String> members = const [],
    List<LinkModel> links = const [],
    String? thumbnail,
  });

  Future<bool> edit({
    required String projectId,
    String? title,
    String? description,
    List<String>? tags,
    bool? isDraft,
    List<String>? attachments,
    List<String>? courses,
    List<LinkModel>? links,
    List<String>? members,
    String? thumbnail,
  });

  Future<List<Project>> fetchAll({
    int page = 1,
    String? sortField,
    String? search,
    int? limit,
    bool isDraft = false,
    bool myProjects = false,
  });

  Future<void> unsavedProject(
    String savedProjectId,
  );
}
