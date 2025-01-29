import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/go_to_top_widget.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import '../../../../Core/Components/project_cards_widget.dart';
import '../../../../Core/Constants/config.dart';
import '../../../../Core/Constants/icons.dart';

class CreateNewProjectBaseScreen extends GetView<CreateNewProjectController> {
  const CreateNewProjectBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConfig().dimens.medium,
        right: AppConfig().dimens.medium,
        top: AppConfig().dimens.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomIconButton(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: 50,
              txtColor: AppConfig().colors.primaryColor,
              title: AppStrings.addNewProject.tr,
              icon: Icon(
                Iconsax.add,
                color: AppConfig().colors.primaryColor,
              ),
              onTap: () => Get.toNamed(
                  AppConfig().routes.createNewProjectScreen,
                  arguments: null,
                  parameters: {'route-from': 'add-project'}),
            ),
          ),
          Gap(AppConfig().dimens.medium),
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: AppConfig().dimens.medium.horizontalPadding,
                child: Text(AppStrings.or.tr),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          Gap(AppConfig().dimens.small),
          Text(
            AppStrings.workOnAProjectFromDraft.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppConfig().colors.darkGrayColor,
            ),
          ),
          Gap(AppConfig().dimens.medium),
          GetBuilder<CreateNewProjectController>(
            init: controller,
            builder: (_) => Expanded(
              child: RefreshIndicator(
                onRefresh: controller.refreshContent,
                child: controller.searchedProjects.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.all(
                            AppConfig().dimens.large,
                          ),
                          child: Text(
                            AppStrings.emptyDraftProject.tr,
                            style: TextStyle(
                              color: AppConfig().colors.darkGrayColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.scrollController,
                        itemCount: controller.searchedProjects.length,
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppConfig().dimens.medium),
                        itemBuilder: (context, index) {
                          final wrappedProjectCard =
                              ProjectCardMyProjectsWidget(
                            btnTitle: AppStrings.edit.tr,
                            onDeleteProject: () => controller.deleteProject(
                                controller.searchedProjects[index]),
                            project: controller.searchedProjects[index],
                            onTapOpenProject: () => controller.routeToProject(
                                controller.searchedProjects[index]),
                          );

                          if (controller.searchedProjects.length > 5 &&
                              index == controller.searchedProjects.length - 1) {
                            return Column(
                              children: [
                                wrappedProjectCard,
                                GoToTopWidget(onTapped: () {
                                  controller.scrollController.animateTo(
                                    0.0,
                                    curve: Curves.easeIn,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                }),
                              ],
                            );
                          } else {
                            return wrappedProjectCard;
                          }
                        },
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
