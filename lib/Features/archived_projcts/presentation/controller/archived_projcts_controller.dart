import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Features/home/domain/home_repository.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../domain/archived_projcts_repo.dart';

class ArchivedProjctsController extends GetxController {
  late ArchivedProjctsRepository repo;
  late HomeRepository homeRepo;

  RxList<Project> archives = RxList([]);

  ArchivedProjctsController({
    required this.repo,
    required this.homeRepo,
  });

  List<Project> unarchiving = [];

  void fetchAllArchives() async {
    archives.clear();
    archives.addAll(await repo.fetchAll());
  }

  @override
  void onInit() {
    fetchAllArchives();
    super.onInit();
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
      await homeRepo.like(projectId: project.id);
    }
    AppRepo().hideLoading();

    fetchAllArchives();
    Get.find<HomeController>().refreshContent(currentPage: true);
  }

  Future<void> unArchive(bool archive, Project project) async {
    unarchiving.add(project);
    archives.refresh();

    final result = await repo.unarchive(archiveId: project.archiveId!);

    unarchiving.removeWhere((element) => element.id == project.id);
    archives.removeWhere((element) => element.id == project.id);
    archives.refresh();

    if (result) {
      Get.find<HomeController>().refreshContent(currentPage: true);
    }
  }
}
