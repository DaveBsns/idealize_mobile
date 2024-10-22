import 'package:get/get.dart';

import '../../data/repo/create_new_project_repo_impl.dart';
import '../controller/create_new_project_controller.dart';

class CreateNewProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewProjectController>(
      () => CreateNewProjectController(
        repo: CreateNewProjectRepositoryImpl(),
      ),
    );
  }
}
