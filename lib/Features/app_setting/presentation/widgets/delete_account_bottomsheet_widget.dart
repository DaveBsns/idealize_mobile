import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/group_radio_btn_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/app_setting/presentation/controller/app_setting_controller.dart';

class DeleteAccountBottomSheet extends GetView<AppSettingController> {
  const DeleteAccountBottomSheet({super.key});

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
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(11),
                    Center(
                      child: Text(
                        "Delete Account",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors().txtColor),
                      ),
                    ),
                    Gap(AppConfig().dimens.medium),
                    Text(
                      "Please choose one of the following options to delete your account:",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors().txtColor),
                    ),
                    Gap(AppConfig().dimens.medium),
                    Obx(
                      () => CustomRadioGroup(
                        radioList: controller.deleteAccountoptions,
                        selected: controller.selecteddeleteAccountoption.value,
                        onSelect: (p0) {
                          controller.selecteddeleteAccountoption.value = p0;
                        },
                      ),
                    ),
                    Gap(AppConfig().dimens.medium),
                    Obx(
                      () => CustomIconButton(
                        title: "Delete Account",
                        onTap: controller.selecteddeleteAccountoption.isNotEmpty
                            ? () {}
                            : null,
                        txtColor: Colors.white,
                        color: AppColors().redColor,
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
    );
  }
}
