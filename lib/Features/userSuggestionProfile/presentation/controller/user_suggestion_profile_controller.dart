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
  bool isProjectsLoading = false;

  @override
  void onInit() {
    super.onInit();

    isLoading = true;
    update();

    repo.getUserProfile(userId: Get.arguments).then((value) {
      isLoading = false;
      user = User.fromJson(value!);
      update();
    }).catchError((e) {
      isLoading = false;
      update();
    });

    isProjectsLoading = true;
    repo.getUserProjects(userId: Get.arguments).then(
      (value) {
        isProjectsLoading = false;
        projects.clear();
        projects.addAll(value);
        update();
      },
    ).catchError((e) {
      isProjectsLoading = false;
      update();
    });
  }
}
