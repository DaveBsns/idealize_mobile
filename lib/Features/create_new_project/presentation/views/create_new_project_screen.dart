import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/stepper_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/global_keys.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/views/create_new_project_step_one_screen.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/views/create_new_project_step_three_screen.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/views/create_new_project_step_two_screen.dart';

class CreateNewProjectScreen extends GetView<CreateNewProjectController> {
  const CreateNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.routeFrom = Get.parameters['route-from'] ?? '';
      if (Get.arguments is Project) {
        controller.updateProjectModel = Get.arguments;
        controller.initUpdateData();
      }
    });

    return Scaffold(
      key: GlobalKeys.addProject,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppConfig().colors.backGroundColor,
        leading: IconButton(
            onPressed: () {
              controller.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: GetBuilder<CreateNewProjectController>(
          init: controller,
          builder: (_) => controller.updateProjectModel != null
              ? Text(
                  "${AppStrings.edit.tr} ${controller.updateProjectModel!.isDraft ? AppStrings.draft.tr : AppStrings.project.tr}",
                )
              : Text(AppStrings.newProject.tr),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConfig().dimens.medium,
            ),
            child: Obx(
              () => CustomStepperWidget(
                backgroundColor: AppConfig().colors.backGroundColor,
                stepCount: 3,
                activeStep: controller.currentStep.value,
              ),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: const [
                CreateNewProjectStepOneScreen(),
                CreateNewProjectStepTwoScreen(),
                CreateNewProjectStepThreeScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
