import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/widgets/add_links_container_widget.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/widgets/courses_container_widget.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/widgets/team_members_container_widget.dart';

import 'package:idealize_new_version/app_repo.dart';

class CreateNewProjectStepTwoScreen
    extends GetView<CreateNewProjectController> {
  const CreateNewProjectStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppConfig().dimens.medium,
            right: AppConfig().dimens.medium,
            bottom: AppConfig().dimens.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.createNewProjectStepTwoCaption.tr,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors().darkGrayColor,
                    ),
              ),
              Gap(AppConfig().dimens.large),
              CoursesContainerWidget(
                selectedCourses: controller.selectedCourses,
                onCoursesChanged: (newCourses) {
                  controller.selectedCourses.clear();
                  controller.selectedCourses.addAll(newCourses);
                  controller.update();
                },
                allCourses: AppRepo()
                    .tags
                    .where((tag) => tag.type == TagType.course)
                    .toList(),
              ),
              Gap(AppConfig().dimens.medium),
              if ((controller.updateProjectModel?.owner?.id ==
                      AppRepo().user!.id) ||
                  controller.updateProjectModel == null)
                Padding(
                  padding: EdgeInsets.only(bottom: AppConfig().dimens.medium),
                  child: TeamMembersContainerWidget(
                    selectedUsers: controller.selectedUsers,
                    onUsersChanged: (newUsers) {
                      controller.selectedUsers.clear();
                      controller.selectedUsers.addAll(newUsers);
                      controller.update();
                    },
                    allUsers: AppRepo().users.toList(),
                  ),
                ),
              AddLinksContainer(
                onAddLink: controller.onAddLink,
                links: controller.links,
                onLinkDeleted: controller.onLinkDeleted,
                onLinkNameChanged: (p0) => controller.linkName = p0,
                onLinkUrlChanged: (p0) => controller.linkUrl = p0,
              ),
              Gap(AppConfig().dimens.medium),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppConfig().dimens.medium,
          right: AppConfig().dimens.medium,
          bottom: AppConfig().dimens.large,
          top: AppConfig().dimens.small,
        ),
        child: GetBuilder<CreateNewProjectController>(
          init: controller,
          builder: (_) => Row(
            children: [
              Expanded(
                child: CustomOutlineIconButton(
                  title: (controller.updateProjectModel == null)
                      ? AppStrings.saveAsDraft.tr
                      : (controller.routeFrom == "add-project")
                          ? AppStrings.saveAsDraft.tr
                          : AppStrings.editAndSave.tr,
                  onTap: (controller.titleCtrl.text.isNotEmpty &&
                          controller.descriptionCtrl.text.isNotEmpty &&
                          controller.selectedTags.isNotEmpty)
                      ? (controller.updateProjectModel != null
                          ? () => controller.updateProject(
                              isDraft: controller.updateProjectModel!.isDraft)
                          : controller.createNewProjectAsDraft)
                      : null,
                ),
              ),
              Gap(AppConfig().dimens.small),
              Expanded(
                child: CustomIconButton(
                  title: AppStrings.next.tr,
                  color: AppConfig().colors.primaryColor,
                  txtColor: Colors.white,
                  onTap: controller.createNewProjectStep3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
