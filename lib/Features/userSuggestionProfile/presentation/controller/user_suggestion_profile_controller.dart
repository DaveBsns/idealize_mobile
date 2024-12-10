import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';

import '../../../../Core/Data/Models/project_model.dart';
import '../../domain/user_suggestion_profile_repo.dart';

class UserSuggestionProfileController extends GetxController {
  late UserSuggestionProfileRepo repo;

  UserSuggestionProfileController(this.repo);

  User? user;
  List<Project> projects = [];

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();

    isLoading = true;
    update();

    repo.getUserProfile(userId: Get.arguments).then((value) {
      user = User.fromJson(value!);
      isLoading = false;
      update();
    }).catchError((e) {
      isLoading = false;
      update();
    });

    repo.getUserProjects(userId: Get.arguments).then(
      (value) {
        projects.clear();
        projects.addAll(value);
        update();
      },
    );
  }
}
