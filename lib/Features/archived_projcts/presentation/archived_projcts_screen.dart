import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/empty_list_widget.dart';
import 'package:idealize_new_version/Core/Components/project_cards_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

import 'controller/archived_projcts_controller.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

class ArchivedProjctsScreen extends GetView<ArchivedProjctsController> {
  const ArchivedProjctsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppConfig().colors.backGroundColor,
        title:  Text(
          AppStrings.favoritesTab.tr,
        ),
      ),
      body: Obx(() => controller.archives.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.all(AppConfig().dimens.medium),
              itemCount: controller.archives.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: AppConfig().dimens.medium),
                child: ProjectCardHomeWidget(
                  onTapLikeCommentToOpenProject: () =>
                      controller.routeToProject(
                    controller.archives[index],
                    scrollToComments: true,
                  ),
                  favoritePage: true,
                  toggleFavorite: (_, __) {
                    controller.unArchive(false, controller.archives[index]);
                  },
                  isLoading: controller.unarchiving
                      .where(
                        (element) =>
                            element.id == controller.archives[index].id,
                      )
                      .toList()
                      .isNotEmpty,
                  project: controller.archives[index],
                  onTapOpenProject: () {
                    Get.toNamed(
                      AppRoutes().projectDetails,
                      arguments: controller.archives[index].id,
                    );
                  },
                ),
              ),
            )
          : EmptyListWidget(
              title: AppStrings.emptyFavoriteProject.tr,
            )),
    );
  }
}
