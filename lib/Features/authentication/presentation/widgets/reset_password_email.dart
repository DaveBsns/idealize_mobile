import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/authentication/presentation/controllers/reset_password_controller.dart';

class ResetPasswordEmailBottomSheet extends GetView<ResetPasswordController> {
  const ResetPasswordEmailBottomSheet({super.key});

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
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
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
                            "Forgot Password",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors().txtColor),
                          ),
                        ),
                        Gap(AppConfig().dimens.medium),
                        Text(
                          AppStrings.resetPasswordCaption.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors().lightGrayColor),
                        ),
                        Gap(AppConfig().dimens.large),
                        Text(
                          "Email Address:",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors().txtColor),
                          textAlign: TextAlign.start,
                        ),
                        Gap(AppConfig().dimens.medium),
                        CustomTextField(
                          controller: controller.emailController,
                          labelText: AppStrings.enterYourEmailAdr.tr,
                        ),
                        Gap(AppConfig().dimens.extraLarge),
                        CustomIconButton(
                          title: "Weiter",
                          onTap: controller.resetPasswordRequest,
                          txtColor: AppColors().primaryColor,
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
      ),
    );
  }
}
