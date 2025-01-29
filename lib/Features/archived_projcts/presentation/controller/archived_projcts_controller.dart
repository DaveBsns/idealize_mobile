import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';

import '../../domain/archived_projcts_repo.dart';

class ArchivedProjctsController extends GetxController {
  late ArchivedProjctsRepository repo;

  RxList<Project> archives = RxList([]);

  ArchivedProjctsController({
    required this.repo,
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

  Future<void> unArchive(bool archive, Project project) async {
    unarchiving.add(project);
    archives.refresh();

    final result = await repo.unarchive(archiveId: project.archiveId!);

    unarchiving.removeWhere((element) => element.id == project.id);
    archives.removeWhere((element) => element.id == project.id);
    archives.refresh();

    if (result) {
      Get.find<HomeController>().refreshContent();
    }
  }
}
