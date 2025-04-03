import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Features/home/domain/home_repository.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../../../Core/Data/Models/project_model.dart';
import '../../domain/user_suggestion_profile_repo.dart';

class UserSuggestionProfileController extends GetxController {
  late UserSuggestionProfileRepo repo;
  late HomeRepository homeRepo;

  UserSuggestionProfileController(this.repo, this.homeRepo);

  User? user;
  List<Project> projects = [];

  bool isLoading = false;
  bool isProjectsLoading = false;

  String? userId;

  @override
  void onInit() {
    super.onInit();

    userId = Get.arguments;

    isLoading = true;
    update();

    repo.getUserProfile(userId: userId!).then((value) {
      isLoading = false;
      user = User.fromJson(value!);
      update();
    }).catchError((e) {
      isLoading = false;
      update();
    });

    isProjectsLoading = true;
    repo.getUserProjects(userId: userId!).then(
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

  void routeToProject(Project project, {bool scrollToComments = false}) {
    Get.toNamed(
      AppConfig().routes.projectDetails,
      arguments: project.id,
      parameters: {
        'scroll-to-comments': '$scrollToComments',
      },
    );
  }

  void toggleLike(Project project) async {
    AppRepo().showLoading();

    if (project.isLiked) {
      await homeRepo.unlike(projectId: project.id);
    } else {
      await homeRepo.like(projectId: project.id, ownerId: project.owner!.id);
    }
    AppRepo().hideLoading();

    _refresh();

    Get.find<HomeController>().refreshContent(currentPage: true);
  }

  Future<void> toggleArchive(bool archive, Project project) async {
    if (!archive && project.archiveId != null) {
      final result = await homeRepo.unarchive(archiveId: project.archiveId!);
      if (result) {
        _refresh();
      }
    } else {
      final archiveId = await homeRepo.archive(
        projectId: project.id,
        projectOwnerId: project.owner!.id,
      );
      if (archiveId != null) {
        _refresh();
      }
    }

    Get.find<HomeController>().refreshContent(currentPage: true);
  }

  void _refresh() {
    isProjectsLoading = true;
    repo.getUserProjects(userId: userId!).then(
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
