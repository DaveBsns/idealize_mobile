import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';

class ArchiveService extends ServicesHelper {
  Future<String?> archiveProject(String projectId, String userId, String projectOwnerId) async {
    // print('Archiving project $projectId for user $userId...');

    final response = await request(
      '$baseURL/archive/new',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        'projectId': projectId,
        'userId': userId,
        'projectOwnerId': projectOwnerId
      },
    );

    // print('Response from server: $response');
    return response['_id'];
  }

  Future<bool> unarchiveProject(String archiveId) async {
    final response = await request(
      '$baseURL/archive/$archiveId',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    if (response == null || response.toString().isEmpty) {
      return true;
    }

    return response.toString().toLowerCase() == 'true';
  }

  Future<List<dynamic>> getAllArchives() async {
    final response = await request(
      '$baseURL/archive/all',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    if (response == null || response.toString().isEmpty) {
      return [];
    }

    return response;
  }
}
