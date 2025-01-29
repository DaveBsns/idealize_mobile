import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Features/home/domain/home_repository.dart';

class HomeController extends GetxController {
  late HomeRepository repo;

  HomeController({
    required this.repo,
  });

  bool loading = false;
  List<Project> searchedProjects = [];
  String selectedFilter = 'all-projects';
  ScrollController scrollController = ScrollController();

  int hasNewNotfications = 0;

  int page = 1;
  bool lastPage = false;
  String searchInput = '';
  List<Project> projects = [];

  @override
  void onInit() {
    getUnreadNotificationsCount();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        _lazyLoad();
      });
    });
    super.onInit();
  }

  Future<void> _fetchAllTheProjects() async {
    getUnreadNotificationsCount();
    if (loading || lastPage) return;

    loading = true;
    update();

    final result = await repo.fetchAll(
      page: page,
      searchInput: searchInput,
      selectedSegment: selectedFilter,
    );

    if (result.isNotEmpty) {
      projects.clear();
      projects.addAll(projects);
    }

    if (page == 1) {
      searchedProjects.clear();
    }

    searchedProjects.addAll(result);
    if (result.isNotEmpty) {
      _pageIncreament();
    } else {
      lastPage = true;
    }

    loading = false;
    update();
  }

  void search() {
    FocusManager.instance.primaryFocus?.unfocus();
    _resetPage();
    _fetchAllTheProjects();
  }

  Future<void> refreshContent() async {
    _resetPage();
    await _fetchAllTheProjects();
  }

  Future<void> init() async {
    await _fetchAllTheProjects();
  }

  void updateSegmentValue(Set<String> indexes) {
    selectedFilter = indexes.first;
    update();
    refreshContent();
  }

  void _resetPage() {
    page = 1;
    lastPage = false;
  }

  void _pageIncreament() => page++;

  void _lazyLoad() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      _fetchAllTheProjects();
    }
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

  Future<void> toggleArchive(bool archive, Project project) async {
    if (!archive && project.archiveId != null) {
      final result = await repo.unarchive(archiveId: project.archiveId!);
      if (result) {
        updateProjectArchiveInList(project, archive: false, archiveId: null);
      }
    } else {
      final archiveId = await repo.archive(projectId: project.id);
      if (archiveId != null) {
        updateProjectArchiveInList(project,
            archive: true, archiveId: archiveId);
      }
    }
  }

  void updateProjectArchiveInList(
    Project project, {
    required bool archive,
    required String? archiveId,
  }) {
    final index =
        searchedProjects.indexWhere((element) => element.id == project.id);
    searchedProjects[index].archiveId = archiveId;
    searchedProjects[index].isArchived = archive;

    update();
  }

  void getUnreadNotificationsCount() async {
    hasNewNotfications = await repo.unreadNotifications();
    update();
  }
}
