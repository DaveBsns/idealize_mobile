import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';

class LikeService extends ServicesHelper {
  Future<bool> likeProject(
      String projectId, String userId, String ownerId) async {
    final response = await request(
      '$baseURL/project-likes/like',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        'projectId': projectId,
        'userId': userId,
        'projectOwnerId': ownerId,
      },
    );

    return response.toString().toLowerCase() == 'true';
  }

  Future<bool> unlikeProject(
    String likeId,
  ) async {
    final response = await request(
      '$baseURL/project-likes/$likeId',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return response.toString().toLowerCase() == 'true';
  }

  Future<dynamic> likes(String projectId) async {
    final response = await request(
      '$baseURL/project-likes/$projectId',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return response;
  }
}
