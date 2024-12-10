import 'package:get/get.dart';
import 'package:idealize_new_version/Features/userSuggestionProfile/data/user_suggestion_profile_repo_impl.dart';

import '../controller/user_suggestion_profile_controller.dart';

class UserSuggestionProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSuggestionProfileController>(
      () => UserSuggestionProfileController(
        UserSuggestionProfileRepoImpl(),
      ),
    );
  }
}
