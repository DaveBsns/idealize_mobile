import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/tabbar_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/my_projects/presentation/widgets/project_item_list_widget.dart';
import 'controller/my_projects_controller.dart';

class MyProjectsScreen extends GetView<MyProjectsController> {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppConfig().colors.backGroundColor,
        title: Text(
          AppStrings.myProjects.tr,
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => CustomTabBar(
              selectedIndex: controller.tabIndex.value,
              onTabSelected: (index) => controller.changeTabIndex(index),
              tabs: [AppStrings.myProjects.tr, AppStrings.drafts.tr],
            ),
          ),
          Expanded(
            child: Obx(() => IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    ProjectItemListWidget(
                      projects: controller.myProjects,
                      isEditLabel: true,
                      onTappedDeleteProject: (project) =>
                          controller.deleteProject(
                        project,
                      ),
                      onTappedOpenProject: (project) =>
                          controller.routeToProject(project),
                    ),
                    ProjectItemListWidget(
                      isEditLabel: true,
                      projects: controller.draftProjects,
                      onTappedDeleteProject: (project) =>
                          controller.deleteProject(
                        project,
                      ),
                      onTappedOpenProject: (project) =>
                          controller.routeToProject(project),
                    ),
                  ],
                )).paddingSymmetric(
              horizontal: AppConfig().dimens.medium,
            ),
          ),
        ],
      ),
    );
  }
}
