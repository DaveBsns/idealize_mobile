import 'package:get/get.dart';

import '../../data/repo/my_projects_repo_impl.dart';
import '../controller/my_projects_controller.dart';

class MyProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProjectsController>(
      () => MyProjectsController(
        repo: MyProjectsRepositoryImpl(),
      ),
    );
  }
}






// import 'package:get/get.dart';
// import 'package:idealize_new_version/Features/My_Projects/my_projects_viewmodel.dart';

// class MyProjectBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<MyProjectsViewModel>(
//       () => MyProjectsViewModel(),
//     );
//   }
// }
