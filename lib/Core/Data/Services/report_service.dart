import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';

class ReportService extends ServicesHelper {
  Future<dynamic> report(
    String projectId,
    String userId, {
    String type = 'project', // 'project' | 'comment' | 'user'
    String content = '',
  }) async {
    return await request(
      '$baseURL/report/new',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        "userId": AppRepo().user!.id,
        "reportedUser": userId,
        "projectId": projectId,
        "type": type,
        "content": content,
      },
    );
  }
}
