import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/stepper_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/register/presentation/controller/register_controller.dart';
import 'package:idealize_new_version/Features/tag_selector/presentation/tag_selector_screen.dart';
import 'package:idealize_new_version/app_repo.dart';
import '../../../../Core/Constants/colors.dart';

class RegisterSecondStepScreen extends GetView<RegisterController> {
  const RegisterSecondStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.signUp.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              controller.cancelOptionalStepsRegistration();
            },
          ).paddingOnly(right: AppConfig().dimens.medium),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStepperWidget(
              backgroundColor: AppConfig().colors.backGroundColor,
              stepCount: 3,
              activeStep: 2,
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.signUpStep2InterestsCaption.tr,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Gap(AppConfig().dimens.small),
                  Container(
                    clipBehavior: Clip.none,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppConfig().dimens.small),
                      border: Border.all(
                        color: AppConfig().colors.lightGrayColor,
                        width: 0.3,
                      ),
                    ),
                    child: Padding(
                      padding: AppConfig().dimens.medium.allPadding,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.interests.tr,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    () => TagSelectorScreen(
                                      title: AppStrings.addInterest.tr,
                                      tagType: TagType.tag,
                                      initialSelectedChipData:
                                          controller.selectedTags,
                                      initialChipData: AppRepo()
                                          .tags
                                          .where(
                                            (tag) => tag.type == TagType.tag,
                                          )
                                          .toList(),
                                      onChipSelectedList: (newList) {
                                        controller.selectedTags.clear();
                                        controller.selectedTags.addAll(newList);
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Iconsax.add_circle,
                                  color: AppColors().primaryColor,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                          Gap(AppConfig().dimens.small),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 8.0,
                              runSpacing: 0.0,
                              children: controller.selectedTags
                                  .map((selectedTag) => Chip(
                                        side: BorderSide.none,
                                        label: Text(
                                          selectedTag.tagName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor:
                                            AppConfig().colors.greenColor,
                                        deleteIcon: const Icon(
                                          Icons.close,
                                          size: 18.0,
                                          color: Colors.white,
                                        ),
                                        onDeleted: () {
                                          controller.selectedTags.removeWhere(
                                              (elem) =>
                                                  elem.id == selectedTag.id);
                                        },
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppStrings.signUpStep2StudyProgramsCaption.tr,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Gap(AppConfig().dimens.small),
                  Container(
                    clipBehavior: Clip.none,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppConfig().dimens.small),
                      border: Border.all(
                        color: AppConfig().colors.lightGrayColor,
                        width: 0.3,
                      ),
                    ),
                    child: Padding(
                      padding: AppConfig().dimens.medium.allPadding,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.studyPrograms.tr,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    () => TagSelectorScreen(
                                      title: AppStrings.addProgram.tr,
                                      tagType: TagType.studyProgram,
                                      initialSelectedChipData:
                                          controller.selectedStudyPrograms,
                                      initialChipData: AppRepo()
                                          .tags
                                          .where(
                                            (tag) =>
                                                tag.type ==
                                                TagType.studyProgram,
                                          )
                                          .toList(),
                                      onChipSelectedList: (newList) {
                                        controller.selectedStudyPrograms
                                            .clear();
                                        controller.selectedStudyPrograms
                                            .addAll(newList);
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Iconsax.add_circle,
                                  color: AppColors().primaryColor,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                          Gap(AppConfig().dimens.small),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 8.0,
                              runSpacing: 0.0,
                              children: controller.selectedStudyPrograms
                                  .map((selectedTag) => Chip(
                                        side: BorderSide.none,
                                        label: Text(
                                          selectedTag.tagName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor:
                                            AppConfig().colors.purpleColor,
                                        deleteIcon: const Icon(
                                          Icons.close,
                                          size: 18.0,
                                          color: Colors.white,
                                        ),
                                        onDeleted: () {
                                          controller.selectedStudyPrograms
                                              .removeWhere((elem) =>
                                                  elem.id == selectedTag.id);
                                        },
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(AppConfig().dimens.medium),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom
              : AppConfig().dimens.medium,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: CustomOutlineIconButton(
              title: AppStrings.skip.tr,
              onTap: () => controller.cancelOptionalStepsRegistration(),
              txtColor: AppColors().primaryColor,
            )),
            Gap(AppConfig().dimens.medium),
            Expanded(
                child: CustomIconButton(
              title: AppStrings.next.tr,
              onTap: () =>
                  Get.toNamed(AppConfig().routes.registrationThirdStep),
              txtColor: AppColors().primaryColor,
            )),
          ],
        ).paddingAll(AppConfig().dimens.medium),
      ),
    );
  }
}
