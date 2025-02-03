import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/group_radio_btn_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
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
                        AppStrings.deleteAccount.tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors().txtColor),
                      ),
                    ),
                    Gap(AppConfig().dimens.medium),
                    Text(
                      AppStrings.deleteAccountDesc.tr,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors().txtColor),
                    ),
                    Gap(AppConfig().dimens.medium),
                    Obx(() => controller.projects.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.youHaveToChangeTheOwner.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        color: AppColors().redColor),
                              ),
                              const Gap(20.0),
                              for (final item in controller.projects)
                                ProjectDeleteItem(
                                  project: item,
                                )
                            ],
                          )),
                    Gap(AppConfig().dimens.medium),
                    Column(
                      children: [
                        CustomIconButton(
                          title: AppStrings.yesDelete.tr,
                          onTap: controller.delete,
                          txtColor: Colors.white,
                          color: AppColors().redColor,
                        ),
                        const Gap(10),
                        CustomIconButton(
                          title: AppStrings.cancel.tr,
                          onTap: Get.back,
                          txtColor: Colors.black,
                          color: Colors.white,
                        ),
                      ],
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

class ProjectDeleteItem extends StatelessWidget {
  final Map<String, dynamic> project;
  const ProjectDeleteItem({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().redColor,
          width: 2,
        ),
      ),
      child: Text(
        project['title'],
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors().redColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
