import 'package:get/get.dart';

import '../../data/repo/register_repo_impl.dart';
import '../controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        repo: RegisterRepositoryImpl(),
      ),
    );
  }
}
