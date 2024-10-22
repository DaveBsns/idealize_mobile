import 'package:get/get.dart';
import 'package:idealize_new_version/Features/splash/data/repo/splash_repo_impl.dart';
import 'package:idealize_new_version/Features/splash/presentation/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        repo: SplashRepositoryImpl(),
      ),
    );
  }
}
