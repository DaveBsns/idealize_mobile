import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';

class BugReportService extends ServicesHelper {
  Future<dynamic> report({
    required String bugDetails,
  }) async {
    return await request(
      '$baseURL/bug-report/new',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        "userId": AppRepo().user!.id,
        "content": bugDetails,
      },
    );
  }
}
