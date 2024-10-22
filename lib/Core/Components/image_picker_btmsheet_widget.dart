import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';

class ImagePickerBottomSheetWidget extends StatelessWidget {
  final VoidCallback onTapGallery;
  final VoidCallback onTapCamera;

  const ImagePickerBottomSheetWidget({
    super.key,
    required this.onTapGallery,
    required this.onTapCamera,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textStyles = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filled(
                    padding: const EdgeInsets.all(20),
                    onPressed: onTapGallery,
                    icon: const Icon(Iconsax.gallery),
                    iconSize: 40,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        AppConfig().colors.primaryColor,
                      ),
                    ),
                  ),
                  Gap(AppConfig().dimens.small),
                  Text(
                    'Gallery',
                    style: textStyles.titleMedium!.copyWith(
                      color: AppConfig().colors.darkGrayColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Gap(AppConfig().dimens.extraLarge),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filled(
                    padding: const EdgeInsets.all(20),
                    onPressed: onTapCamera,
                    icon: const Icon(Iconsax.camera),
                    iconSize: 40,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        AppConfig().colors.primaryColor,
                      ),
                    ),
                  ),
                  Gap(AppConfig().dimens.small),
                  Text(
                    'Camera',
                    style: textStyles.titleMedium!.copyWith(
                      color: AppConfig().colors.darkGrayColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close,
                  size: 25,
                  color: AppConfig().colors.lightGrayColor,
                ),
              )
            ],
          ).paddingOnly(
            left: AppConfig().dimens.large,
            right: AppConfig().dimens.large,
            top: AppConfig().dimens.large,
            bottom: AppConfig().dimens.extraLarge,
          ),
        ),
      ),
    );
  }
}
