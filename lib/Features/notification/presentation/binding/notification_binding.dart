import 'package:get/get.dart';

import '../../data/repo/notification_repo_impl.dart';
import '../controller/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(
        repo: NotificationRepositoryImpl(),
      ),
    );
  }
}
