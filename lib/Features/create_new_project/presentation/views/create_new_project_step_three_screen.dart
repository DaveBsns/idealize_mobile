import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/widgets/step_three_upload_file_widget.dart';

class CreateNewProjectStepThreeScreen
    extends GetView<CreateNewProjectController> {
  const CreateNewProjectStepThreeScreen({super.key});

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
          child: const StepThreeUploadFilewidget(),
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
          builder: (_) {
            if (controller.updateProjectModel != null &&
                !controller.updateProjectModel!.isDraft &&
                controller.routeFrom != 'add-project') {
              return CustomIconButton(
                  // title: controller.updateProjectModel != null
                  title: AppStrings.publish.tr,
                  txtColor: AppConfig().colors.primaryColor,
                  color: AppConfig().colors.secondaryColor,
                  onTap: controller.updateProjectModel != null
                      ? () => controller.updateProject(isDraft: false)
                      : controller.createNewProject);
            }
            return Row(
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
                      // title: controller.updateProjectModel != null
                      title: AppStrings.publish.tr,
                      txtColor: AppConfig().colors.primaryColor,
                      color: AppConfig().colors.secondaryColor,
                      onTap: controller.updateProjectModel != null
                          ? () => controller.updateProject(isDraft: false)
                          : controller.createNewProject),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
