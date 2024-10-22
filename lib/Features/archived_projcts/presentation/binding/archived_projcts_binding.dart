import 'package:get/get.dart';

import '../../data/repo/archived_projcts_repo_impl.dart';
import '../controller/archived_projcts_controller.dart';

class ArchivedProjctsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArchivedProjctsController>(
      () => ArchivedProjctsController(
        repo: ArchivedProjctsRepositoryImpl(),
      ),
    );
  }
}
