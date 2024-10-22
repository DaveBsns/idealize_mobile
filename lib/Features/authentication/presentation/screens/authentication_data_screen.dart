import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/authentication/data/repository/reset_password_repository_impl.dart';
import 'package:idealize_new_version/Features/authentication/presentation/controllers/authentication_controller.dart';
import 'package:idealize_new_version/Features/authentication/presentation/controllers/reset_password_controller.dart';
import 'package:idealize_new_version/Features/authentication/presentation/widgets/reset_password_email.dart';

class AuthenticationDataScreen extends GetView<AuthenticationController> {
  const AuthenticationDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors().backGroundColor,
      appBar: AppBar(
        title: Text(AppStrings.signIn.tr),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              AppStrings.email.tr,
              style: textTheme.titleMedium,
            ),
            Gap(AppConfig().dimens.small),
            CustomTextField(
              key: const Key('auth_username'),
              controller: controller.usernameCtrl,
              labelText: AppStrings.emailHint.tr,
            ),
            Gap(AppConfig().dimens.medium),
            Text(
              AppStrings.password.tr,
              style: textTheme.titleMedium,
            ),
            Gap(AppConfig().dimens.small),
            CustomTextField(
              key: const Key('auth_password'),
              controller: controller.passwordCtrl,
              labelText: AppStrings.passwordHint.tr,
              isPassword: true,
              secondIcon: Icons.remove_red_eye,
              onSecondIconPressed: () {
                controller.isPassword.value = !controller.isPassword.value;
              },
            ),
            Gap(AppConfig().dimens.large),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (BuildContext context) {
                  try {
                    Get.put(
                      ResetPasswordController(
                        repo: ResetPasswordRepositoryImpl(),
                      ),
                    );
                  } catch (er) {
                    debugPrint(
                        'Error at (lib/Features/authentication/presentation/screens/authentication_data_screen.dart) > $er');
                  }
                  return const ResetPasswordEmailBottomSheet();
                },
              ),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: AppStrings.forgotPassword.tr,
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const WidgetSpan(
                        child: SizedBox(width: 7),
                      ),
                      TextSpan(
                        text: AppStrings.resetIt.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: AppStrings.here.tr,
                        style:
                            TextStyle(color: AppConfig().colors.secondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).paddingAll(
          AppConfig().dimens.medium,
        ),
      ),
      bottomNavigationBar: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomIconButton(
                title: AppStrings.signIn.tr,
                onTap: controller.loading.value ? null : controller.signIn,
                txtColor: AppColors().primaryColor,
              ),
              Gap(AppConfig().dimens.medium),
              GestureDetector(
                onTap: () =>
                    Get.offAndToNamed(AppConfig().routes.registrationFirstStep),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppStrings.dontHaveAnAccount.tr,
                    style: TextStyle(color: AppConfig().colors.primaryColor),
                    children: [
                      const WidgetSpan(
                        child: SizedBox(width: 7),
                      ),
                      TextSpan(
                        text: AppStrings.signUp.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "  ${AppStrings.here.tr}",
                        style: TextStyle(
                          color: AppConfig().colors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )).paddingOnly(
        left: AppConfig().dimens.medium,
        right: AppConfig().dimens.medium,
        bottom: MediaQuery.of(context).padding.bottom > 0
            ? MediaQuery.of(context).padding.bottom
            : AppConfig().dimens.medium,
        top: AppConfig().dimens.small,
      ),
    );
  }
}
