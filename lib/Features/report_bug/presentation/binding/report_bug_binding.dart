import 'package:get/get.dart';
import 'package:idealize_new_version/Features/report_bug/data/repo/report_bug_repo_impl.dart';
import 'package:idealize_new_version/Features/report_bug/presentation/controller/report_bug_controller.dart';

class ReportBugBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportBugController>(
      () => ReportBugController(
        repo: ReportBugRepoImpl(),
      ),
    );
  }
}
