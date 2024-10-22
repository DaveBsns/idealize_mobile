import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/group_radio_btn_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/app_setting/presentation/controller/app_setting_controller.dart';

import 'package:idealize_new_version/app_repo.dart';

class LanguageBottomSheetWidget extends GetView<AppSettingController> {
  const LanguageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: AppConfig().dimens.medium.allPadding,

            // TODO double check widget tree
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(11),
                      Center(
                        child: Text(
                          AppStrings.language.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors().txtColor),
                        ),
                      ),
                      Gap(AppConfig().dimens.medium),
                      Obx(
                        () => CustomRadioGroup(
                          radioList: controller.languagesOptions,
                          selected: controller.selectedLanguageOption.value,
                          onSelect: (p0) {
                            controller.selectedLanguageOption.value = p0;
                            AppRepo().toggleLanguage();
                            // AppRepo().setNewLocale(p0);
                            // AppRepo().setDefaultLocale();
                          },
                        ),
                      ),
                      Gap(AppConfig().dimens.large),
                    ],
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
