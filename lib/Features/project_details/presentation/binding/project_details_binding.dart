import 'package:get/get.dart';

import '../../data/repo/project_details_repo_impl.dart';
import '../controller/project_details_controller.dart';

class ProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDetailsController>(
      () => ProjectDetailsController(
        repo: ProjectDetailsRepositoryImpl(),
      ),
    );
  }
}
