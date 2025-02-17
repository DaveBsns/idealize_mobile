import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/tag_selector/presentation/tag_selector_screen.dart';
import 'package:idealize_new_version/app_repo.dart';

import 'package:get/get.dart';

import 'package:idealize_new_version/Core/I18n/messages.dart';

class CoursesContainerWidget extends StatelessWidget {
  final List<Tag> selectedCourses;
  final Function(List<Tag>) onCoursesChanged;
  final List<Tag> allCourses;

  const CoursesContainerWidget({
    super.key,
    required this.selectedCourses,
    required this.onCoursesChanged,
    required this.allCourses,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        clipBehavior: Clip.none,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppConfig().colors.backGroundColor,
          borderRadius: BorderRadius.circular(AppConfig().dimens.small),
          border: Border.all(
            color: AppConfig().colors.darkGrayColor,
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
                  Expanded(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 0.0,
                      children: [
                        Text(
                          AppStrings.courses.tr + " :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () => AppRepo().showCustomAlertDialog(
                            title: AppStrings.dailogAddCoursesTitle.tr,
                            content: AppStrings.dailogAddCoursesContent.tr,
                            buttonText: AppStrings.okay.tr,
                            buttonTextStyle: TextStyle(
                                color: AppConfig().colors.primaryColor,
                                fontWeight: FontWeight.w700),
                            buttonColor: AppConfig().colors.secondaryColor,
                          ),
                          child: Icon(
                            Iconsax.info_circle,
                            color: AppConfig().colors.lightGrayColor,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomOutlineIconButton(
                    title: AppStrings.addCourses.tr,
                    icon: const Icon(Iconsax.add),
                    width: 160,
                    height: 45,
                    onTap: () {
                      Get.to(
                        () => TagSelectorScreen(
                          title: AppStrings.courses.tr,
                          tagType: TagType.course,
                          initialSelectedChipData: selectedCourses,
                          initialChipData: allCourses,
                          onChipSelectedList: (newList) {
                            onCoursesChanged(newList);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              selectedCourses.isNotEmpty
                  ? Gap(AppConfig().dimens.small)
                  : const SizedBox.shrink(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 0.0,
                  children: selectedCourses
                      .map((selectedTag) => Chip(
                            side: BorderSide.none,
                            label: Text(
                              selectedTag.tagName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: AppConfig().colors.greenColor,
                            deleteIcon: const Icon(
                              Icons.close,
                              size: 18.0,
                              color: Colors.white,
                            ),
                            onDeleted: () {
                              selectedCourses.removeWhere(
                                  (elem) => elem.id == selectedTag.id);
                              onCoursesChanged(List.from(selectedCourses));
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
