import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/project_cards_widget.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

import '../../../Core/Components/image_loader_widget.dart';
import '../../../Core/Constants/config.dart';
import '../../../Core/I18n/messages.dart';
import '../../../gen/assets.gen.dart';
import 'controller/user_suggestion_profile_controller.dart';

class UserSuggestionProfileScreen
    extends GetView<UserSuggestionProfileController> {
  const UserSuggestionProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: MediaQuery.of(context).orientation == Orientation.portrait
          ? Colors.white
          : AppConfig().colors.backGroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          backgroundColor: AppConfig().colors.backGroundColor,
          body: GetBuilder<UserSuggestionProfileController>(
              init: controller,
              builder: (state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: AppConfig().colors.lightGrayColor,
                              width: 0.3,
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: AppConfig().dimens.medium.allPadding,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Gap(AppConfig().dimens.small),
                                  AppImageLoader(
                                    imageId:
                                        controller.user?.profilePicture?.id ??
                                            '',
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    placeholder: Container(
                                      height: 170,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              AppConfig().colors.primaryColor,
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(Assets
                                              .png.placeholderProfile.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(AppConfig().dimens.medium),
                                  Text(
                                    "${state.user?.firstname} ${state.user?.surname}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppConfig().colors.primaryColor,
                                    ),
                                  ),
                                  Gap(AppConfig().dimens.extraSmall),
                                  Text(
                                    state.user?.email ?? '',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppConfig().colors.primaryColor,
                                    ),
                                  ),
                                  Gap(AppConfig().dimens.extraSmall),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(AppConfig().dimens.large),
                      Gap(AppConfig().dimens.large),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConfig().dimens.medium),
                        child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.interests.tr,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
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
                                    children:
                                        (controller.user?.interestedTags ?? [])
                                            .map((selectedTag) => Chip(
                                                  side: BorderSide.none,
                                                  label: Text(
                                                    selectedTag.tagName,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  backgroundColor: AppConfig()
                                                      .colors
                                                      .greenColor,
                                                ))
                                            .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(AppConfig().dimens.medium),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConfig().dimens.medium),
                        child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.studyPrograms.tr,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
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
                                    children: (controller.user?.studyPrograms ??
                                            [])
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
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(AppConfig().dimens.medium),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConfig().dimens.medium),
                        child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.projects.tr,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Gap(AppConfig().dimens.small),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Column(
                                    children: [
                                      for (final project in state.projects)
                                        ProjectCardHomeWidget(
                                          project: project,
                                          isLoading: false,
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(AppConfig().dimens.large),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
