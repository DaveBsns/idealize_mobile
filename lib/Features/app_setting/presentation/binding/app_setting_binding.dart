import 'package:get/get.dart';

import '../../data/repo/app_setting_repo_impl.dart';
import '../controller/app_setting_controller.dart';

class AppSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSettingController>(
      () => AppSettingController(
        repo: AppSettingRepositoryImpl(),
      ),
    );
  }
}
