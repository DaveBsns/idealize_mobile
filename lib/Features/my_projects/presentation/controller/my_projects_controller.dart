import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

import '../../domain/my_projects_repo.dart';

class MyProjectsController extends GetxController {
  late MyProjectsRepository repo;

  var tabIndex = 0.obs;
  int _page = 1;

  RxList<Project> draftProjects = RxList<Project>.empty();
  RxList<Project> myProjects = RxList<Project>.empty();

  MyProjectsController({
    required this.repo,
  });

  @override
  void onInit() {
    super.onInit();

    tabIndex.value = 0;
    _page = 1;
    _fetchAllMyProjects();
  }

  refreshContent() async {
    tabIndex.value = 0;
    _page = 1;
    if (tabIndex.value == 0) {
      await _fetchAllMyProjects();
    } else {
      await _fetchAllDraftProjects();
    }

    update();
  }

  void deleteProject(Project project) async {
    // loading.value = true;
    update();
    await repo.delete(project.id);

    if (tabIndex.value == 0) {
      myProjects.removeWhere((element) => element.id == project.id);
    } else {
      draftProjects.removeWhere((element) => element.id == project.id);
    }
    tabIndex.refresh();
    update();
    // refreshContent();
  }

  void routeToProject(Project project) {
    Get.toNamed(AppConfig().routes.createNewProjectScreen,
        arguments: project, parameters: {'route-from': 'my-projects'});
  }

  void changeTabIndex(int index) async {
    _page = 1;
    tabIndex.value = index;

    if (tabIndex.value == 0) {
      await _fetchAllMyProjects();
    } else {
      await _fetchAllDraftProjects();
    }
  }

  Future<void> _fetchAllDraftProjects({bool loadPreviousPage = false}) async {
    final response = await repo.fetchAll(
      page: (loadPreviousPage && _page > 1) ? _page - 1 : _page,
      myProjects: true,
      isDraft: true,
    );

    if (_page == 1) {
      draftProjects.clear();
    }

    if (response.isEmpty) {
    } else {
      draftProjects.addAll(response);
      if (!loadPreviousPage) {
        _page++;
      }
    }

    tabIndex.refresh();
  }

  Future<void> _fetchAllMyProjects({bool loadPreviousPage = false}) async {
    final response = await repo.fetchAll(
      page: (loadPreviousPage && _page > 1) ? _page - 1 : _page,
      myProjects: true,
      isDraft: false,
    );

    if (_page == 1) {
      myProjects.clear();
    }

    if (response.isEmpty) {
    } else {
      myProjects.addAll(response);
      if (!loadPreviousPage) {
        _page++;
      }
    }

    tabIndex.refresh();
  }
}
