import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';

class JoinProjectService extends ServicesHelper {
  Future<dynamic> joinProject(
      String projectId, String userId, String? message) async {
    return await request(
      '$baseURL/join-requests',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        'projectId': projectId,
        'receiver': userId,
        'type': 'joinTeamMember',
        'message': message,
      },
    );
  }

  Future<void> responseToProjectRequest(String projectId, String notificationId,
      String userId, RequestResponseType action, String requestType) async {
    await request(
      '$baseURL/join-requests/join',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        'projectId': projectId,
        'notificationId': notificationId,
        'userId': userId,
        'action': action.toString().split('.').last,
        'type': requestType,
      },
    );
  }
}
