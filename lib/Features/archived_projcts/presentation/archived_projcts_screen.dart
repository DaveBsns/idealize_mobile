import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/empty_list_widget.dart';
import 'package:idealize_new_version/Core/Components/project_cards_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';

import 'controller/archived_projcts_controller.dart';

class ArchivedProjctsScreen extends GetView<ArchivedProjctsController> {
  const ArchivedProjctsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppConfig().colors.backGroundColor,
        title: const Text(
          "Favorites",
        ),
      ),
      body: Obx(() => controller.archives.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.all(AppConfig().dimens.medium),
              itemCount: controller.archives.length,
              itemBuilder: (context, index) => ProjectCardHomeWidget(
                project: controller.archives[index],
                isLoading: false,
                onTapOpenProject: () {
                  Get.toNamed(
                    AppRoutes().projectDetails,
                    arguments: controller.archives[index].id,
                  );
                },
              ),
            )
          : const EmptyListWidget(
              title: "You don't have any favorite projects yet.",
            )),
    );
  }
}
