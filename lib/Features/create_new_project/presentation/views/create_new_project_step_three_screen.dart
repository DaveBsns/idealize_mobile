import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.createNewProjectStepThreeCaption.tr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors().darkGrayColor,
                      ),
                ),
              ),
              Gap(AppConfig().dimens.large),
              const StepThreeUploadFilewidget(),
              Gap(AppConfig().dimens.large),
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
                  child: controller.updateProjectModel == null
                      ? Obx(
                          () => Opacity(
                            opacity: controller.checkboxValue.value ==
                                    CustomCheckBoxValue.checked
                                ? 1
                                : 0.5,
                            child: CustomOutlineIconButton(
                              title: AppStrings.saveAsDraft.tr,
                              onTap: () {
                                if (controller.titleCtrl.text.isNotEmpty &&
                                    controller
                                        .descriptionCtrl.text.isNotEmpty &&
                                    controller.selectedTags.isNotEmpty) {
                                  if (controller.checkboxValue.value ==
                                      CustomCheckBoxValue.checked) {
                                    controller.createNewProjectAsDraft();
                                  } else {
                                    controller.checkboxValue.value =
                                        CustomCheckBoxValue.error;
                                  }
                                }
                              },
                            ),
                          ),
                        )
                      : CustomOutlineIconButton(
                          title: (controller.routeFrom == "add-project")
                              ? AppStrings.saveAsDraft.tr
                              : AppStrings.editAndSave.tr,
                          onTap: () {
                            if (controller.titleCtrl.text.isNotEmpty &&
                                controller.descriptionCtrl.text.isNotEmpty &&
                                controller.selectedTags.isNotEmpty) {
                              controller.updateProject(
                                  isDraft:
                                      controller.updateProjectModel!.isDraft);
                            }
                          },
                        ),
                ),
                Gap(AppConfig().dimens.small),
                Expanded(
                    child: controller.updateProjectModel != null
                        ? CustomIconButton(
                            title: AppStrings.publish.tr,
                            txtColor: AppConfig().colors.primaryColor,
                            color: AppConfig().colors.secondaryColor,
                            onTap: () {
                              controller.updateProject(isDraft: false);
                            },
                          )
                        : Obx(
                            () => Opacity(
                              opacity: controller.checkboxValue.value ==
                                      CustomCheckBoxValue.checked
                                  ? 1
                                  : 0.5,
                              child: CustomIconButton(
                                title: AppStrings.publish.tr,
                                txtColor: AppConfig().colors.primaryColor,
                                color: AppConfig().colors.secondaryColor,
                                onTap: () {
                                  if (controller.checkboxValue.value ==
                                      CustomCheckBoxValue.checked) {
                                    controller.createNewProject();
                                  } else {
                                    controller.checkboxValue.value =
                                        CustomCheckBoxValue.error;
                                  }
                                },
                              ),
                            ),
                          )),
              ],
            );
          },
        ),
      ),
    );
  }
}
