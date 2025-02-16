import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import 'package:idealize_new_version/Core/Data/Services/upload_service.dart';
import '../../../../Core/Data/Models/link_model.dart';
import '../../domain/create_new_project_repo.dart';

class CreateNewProjectRepositoryImpl implements CreateNewProjectRepository {
  @override
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
  }) async {
    return ProjectService().createNewProject(
      title: title,
      description: description,
      tags: tags,
      isDraft: isDraft,
      attachments: attachments,
      courses: courses,
      links: links,
      teamMembers: members,
      thumbnail: thumbnail,
    );
  }

  @override
  Future<bool> deleteMaterials(String attachementId) async {
    return await ProjectService().deleteMaterial(attachementId);
  }

  @override
  Future<void> deleteProject(String projectId) async {
    await ProjectService().deleteProject(projectId);
  }

  @override
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
  }) async {
    return await ProjectService().editProject(
      id: projectId,
      title: title,
      description: description,
      tags: tags,
      isDraft: isDraft,
      attachments: attachments,
      courses: courses,
      links: links,
      teamMembers: members,
      thumbnail: thumbnail,
    );
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

  @override
  Future<void> unsavedProject(String savedProjectId) async {
    return await ProjectService().removeSaveProject(savedProjectId);
  }

  @override
  Future<ProjectFile?> uploadFile(
      String path, http_parser.MediaType mediaType) async {
    try {
      return await UploadService().uploadFile(
        path: path,
        mediaType: mediaType,
      );
    } catch (e) {
      print('....... upload file error ....... $e');
      return null;
    }
  }
}
