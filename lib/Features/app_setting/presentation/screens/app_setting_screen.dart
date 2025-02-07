import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/app_setting/presentation/widgets/language_bottom_sheet_widget.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../controller/app_setting_controller.dart';

class AppSettingScreen extends GetView<AppSettingController> {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      appBar: AppBar(
        title: Text(AppStrings.settings.tr),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Icon(Icons.sunny,
                  //         size: 25, color: AppConfig().colors.darkGrayColor),
                  //     Gap(AppConfig().dimens.medium),
                  //     Text(AppStrings.darkMode.tr),
                  //     const Spacer(),
                  //     Obx(
                  //       () {
                  //         return CustomSwitchButton(
                  //           value: controller.isDarkMode.value,
                  //           onChanged: (newValue) =>
                  //               controller.isDarkMode.value = newValue,
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // Divider(
                  //   color: AppConfig().colors.lightGrayColor,
                  //   thickness: 0.5,
                  //   height: 40,
                  // ),
                  // InkWell(
                  //   onTap: () => Get.toNamed(AppConfig().routes.textSizeView),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Iconsax.text,
                  //         size: 25,
                  //         color: AppConfig().colors.darkGrayColor,
                  //       ),
                  //       Gap(AppConfig().dimens.medium),
                  //       Text(AppStrings.textSize.tr),
                  //       const Spacer(),
                  //       Icon(
                  //         Icons.arrow_forward_ios_rounded,
                  //         size: 22,
                  //         color: AppConfig().colors.darkGrayColor,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   color: AppConfig().colors.lightGrayColor,
                  //   thickness: 0.5,
                  //   height: 40,
                  // ),
                  InkWell(
                    onTap: () => showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        return const LanguageBottomSheetWidget();
                      },
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.language_square,
                          size: 25,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(AppStrings.language.tr),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(AppConfig().dimens.medium),
            ),
            const Gap(40),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes().reportaBug);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.alarm,
                          size: 25,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(AppStrings.reportBug.tr),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppConfig().colors.lightGrayColor,
                    thickness: 0.5,
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      AppConfig().privacyPolicyUrl.launchURL();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.security_user,
                          size: 25,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(AppStrings.privacy.tr),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppConfig().colors.lightGrayColor,
                    thickness: 0.5,
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      AppConfig().termsCondiftionsUrl.launchURL();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.document,
                          size: 25,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(AppStrings.termsAndConditions.tr
                            .replaceAll(' *.', '')),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),
                  // Divider(
                  //   color: AppConfig().colors.lightGrayColor,
                  //   thickness: 0.5,
                  //   height: 40,
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Iconsax.lock,
                  //         size: 25,
                  //         color: AppConfig().colors.darkGrayColor,
                  //       ),
                  //       Gap(AppConfig().dimens.medium),
                  //       Text(AppStrings.security.tr),
                  //       const Spacer(),
                  //       Icon(
                  //         Icons.arrow_forward_ios_rounded,
                  //         size: 22,
                  //         color: AppConfig().colors.darkGrayColor,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ).paddingAll(AppConfig().dimens.medium),
            ),
            Gap(AppConfig().dimens.large),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes().deleteAccount),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.profile_delete,
                          size: 25,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(AppStrings.deleteAccount.tr),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppConfig().colors.lightGrayColor,
                    thickness: 0.5,
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      await AppRepo().logoutUser();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.logout,
                          size: 25,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(AppStrings.logout.tr),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: AppConfig().colors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(AppConfig().dimens.medium),
            ),
            Gap(AppConfig().dimens.large),
          ],
        ),
      ),
    );
  }
}
