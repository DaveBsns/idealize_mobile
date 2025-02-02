import 'package:idealize_new_version/Core/Data/Services/bug_report_service.dart';
import 'package:idealize_new_version/Features/report_bug/domain/report_bug_repo.dart';

class ReportBugRepoImpl implements ReportBugRepo {
  final service = BugReportService();

  @override
  Future<Map<String, dynamic>?> reportBug({required String bugDesc}) async {
    return await service.report(bugDetails: bugDesc);
  }
}
