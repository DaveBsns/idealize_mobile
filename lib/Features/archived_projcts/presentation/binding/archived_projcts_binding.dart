import 'package:get/get.dart';
import 'package:idealize_new_version/Features/home/data/repository/home_repository_impl.dart';

import '../../data/repo/archived_projcts_repo_impl.dart';
import '../controller/archived_projcts_controller.dart';

class ArchivedProjctsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArchivedProjctsController>(
      () => ArchivedProjctsController(
        repo: ArchivedProjctsRepositoryImpl(),
        homeRepo: HomeRepositoryImpl(),
      ),
    );
  }
}
