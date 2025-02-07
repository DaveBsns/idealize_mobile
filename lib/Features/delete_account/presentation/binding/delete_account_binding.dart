import 'package:get/get.dart';
import 'package:idealize_new_version/Features/delete_account/data/repo/delete_account_repo_impl.dart';
import 'package:idealize_new_version/Features/delete_account/presentation/controller/delete_account_controller.dart';

class DeleteAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAccountController>(
      () => DeleteAccountController(
        repo: DeleteAccountRepoImpl(),
      ),
    );
  }
}
