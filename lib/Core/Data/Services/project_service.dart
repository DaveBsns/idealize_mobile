import 'package:idealize_new_version/Core/Data/Models/link_model.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';

import './services_helper.dart';

class ProjectService extends ServicesHelper {
  Future<List<Project>> fetchAllProject({
    int page = 1,
    String? sortField,
    String? search,
    int? limit,
    bool isDraft = false,
    bool myProjects = false,
    String ownerId = '',
    String? filter,
    String? filterByTag,
  }) async {
    final base =
        myProjects ? '$baseURL/projects/my-projects' : '$baseURL/projects';

    Map<String, dynamic> queryParametrs = {
      'page': page,
      'isDraft': isDraft,
      'limit': limit ?? pageSize,
    };

    if (search != null) {
      queryParametrs['search'] = search;
    }

    if (filter != null) {
      queryParametrs['filter'] = filter;
    }

    if (sortField != null) {
      queryParametrs['sort'] = sortField;
    }

    if (filterByTag != null) {
      queryParametrs['filterByTag'] = filterByTag;
    }

    if (isDraft) {
      queryParametrs['owner'] = AppRepo().user?.id;
    } else {
      if (ownerId.isNotEmpty) {
        queryParametrs['owner'] = ownerId;
      }
    }

    final query = queryMaker(queryParametrs);

    final mappedData = await request(
      '$base/$query',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData != null
        ? [
            for (final mappedProject in mappedData['projects'])
              Project.fromJson(mappedProject),
          ]
        : [];
  }

  Future<void> removeSaveProject(String savedProjectId) async {
    await request(
      '$baseURL/projects/$savedProjectId',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );
  }

  Future<void> createNewProject({
    required String title,
    required String description,
    required List<String> tags,
    List<String>? courses,
    List<String>? teamMembers,
    List<String>? attachments,
    List<LinkModel>? links,
    bool isDraft = false,
    String? thumbnail,
  }) async {
    Map<String, dynamic> body = {
      "title": title,
      "description": description,
      "status": AppRepo().user?.id.toString(),
      "isDraft": isDraft,
      "projectType": "",
      "teamMembers": teamMembers ?? [],
      "tags": tags,
      "courses": courses ?? [],
      "owner": AppRepo().user?.id.toString(),
      "attachments": attachments ?? [],
      "links": links != null
          ? [
              for (final itemLink in links)
                {
                  'label': itemLink.label,
                  'link': itemLink.link,
                }
            ]
          : [],
    };

    if (thumbnail != null) {
      body['thumbnail'] = thumbnail;
    }

    await request(
      '$baseURL/projects/new',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: body,
    );
  }

  Future<void> deleteProject(String projectId) async {
    await request(
      '$baseURL/projects/$projectId',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );
  }

  Future<Project> getProjectDetails(String projectId) async {
    final mappedData = await request(
      '$baseURL/projects/$projectId',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return Project.fromJson(mappedData);
  }

  Future<bool> deleteMaterial(String attachmentId) async {
    return await request(
      '$baseURL/uploads/$attachmentId',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );
  }

  Future<bool> editProject({
    required String id,
    String? title,
    String? description,
    List<String>? tags,
    List<String>? courses,
    List<String>? teamMembers,
    List<String>? attachments,
    List<LinkModel>? links,
    bool? isDraft,
    String? thumbnail,
  }) async {
    Map<String, dynamic> body = {};

    if (title != null) {
      body['title'] = title;
    }

    if (description != null) {
      body['description'] = description;
    }

    if (tags != null) {
      body['tags'] = tags;
    }

    if (courses != null) {
      body['courses'] = courses;
    }

    if (teamMembers != null) {
      body['teamMembers'] = teamMembers;
    }

    if (attachments != null) {
      body['attachments'] = attachments;
    }

    if (links != null) {
      body['links'] = [
        for (final itemLink in links)
          {
            'label': itemLink.label,
            'link': itemLink.link,
          }
      ];
    }

    if (isDraft != null) {
      body['isDraft'] = isDraft;
    }

    if (thumbnail != null) {
      body['thumbnail'] = thumbnail;
    }

    final response = await request(
      '$baseURL/projects/$id',
      serviceType: ServiceType.put,
      requiredDefaultHeader: true,
      body: body,
    );

    if (response == null || response.toString().isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
