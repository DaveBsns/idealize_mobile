import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import 'package:idealize_new_version/Features/home/domain/home_repository.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../domain/my_projects_repo.dart';

class MyProjectsController extends GetxController {
  late MyProjectsRepository repo;
  late HomeRepository homeRepo;

  var tabIndex = 0.obs;
  int _page = 1;

  RxList<Project> draftProjects = RxList<Project>.empty();
  RxList<Project> myProjects = RxList<Project>.empty();

  MyProjectsController({
    required this.repo,
    required this.homeRepo,
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

  void toggleLike(Project project) async {
    AppRepo().showLoading();

    if (project.isLiked) {
      await homeRepo.unlike(projectId: project.id);
    } else {
      await homeRepo.like(
        projectId: project.id,
        ownerId: project.owner?.id ?? '',
      );
    }
    AppRepo().hideLoading();

    refreshContent();
    Get.find<HomeController>().refreshContent(currentPage: true);
  }

  void routeToProjectDetails(Project project, {bool scrollToComments = false}) {
    Get.toNamed(
      AppConfig().routes.projectDetails,
      arguments: project.id,
      parameters: {
        'scroll-to-comments': '$scrollToComments',
      },
    );
  }

  void deleteProject(Project project) async {
    AppRepo().showCustomAlertDialog(
      title: AppStrings.deleteProject.tr,
      content: AppStrings.deleteProjectContent.trParams(
        {
          'projectKeyword': '"${project.title}"',
        },
      ),
      buttonText: AppStrings.delete.tr,
      onPressed: () async {
        // loading.value = true;
        AppRepo().showLoading();
        update();
        await Future.delayed(const Duration(milliseconds: 1000));
        try {
          final res = await repo.delete(project.id);
          // update projects page
          final createNewProjectController =
              Get.find<CreateNewProjectController>();
          await createNewProjectController.refreshContent();

          if (res) {
            if (tabIndex.value == 0) {
              myProjects.removeWhere((element) => element.id == project.id);
            } else {
              draftProjects.removeWhere((element) => element.id == project.id);
            }
            tabIndex.refresh();
            update();
            // refreshContent();
          }

          AppRepo().hideLoading();
          Get.back();
        } catch (er) {
          AppRepo().hideLoading();
          Get.back();
          AppRepo().showSnackbar(
            label: AppStrings.error.tr,
            text: er.toString(),
          );
        }
      },
      buttonTextStyle: TextStyle(
        color: AppConfig().colors.primaryColor,
        fontWeight: FontWeight.w700,
      ),
      buttonColor: AppConfig().colors.secondaryColor,
      outlinedButtonText: AppStrings.cancel.tr,
      outlinedButtonColor: Colors.transparent,
      outlinedButtonBorderColor: AppConfig().colors.darkGrayColor,
      outlinedButtonTextStyle: TextStyle(
        color: AppConfig().colors.darkGrayColor,
        fontWeight: FontWeight.w700,
      ),
      outlinedButtonOnPressed: () => Get.back(),
    );
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
