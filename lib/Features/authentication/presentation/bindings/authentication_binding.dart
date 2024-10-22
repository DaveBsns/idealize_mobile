import 'package:get/get.dart';
import 'package:idealize_new_version/Features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:idealize_new_version/Features/authentication/presentation/controllers/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(
        repo: AuthenticationRepositoryImpl(),
      ),
    );
  }
}
