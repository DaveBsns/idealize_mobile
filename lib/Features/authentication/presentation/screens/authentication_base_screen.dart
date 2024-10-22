import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/authentication/presentation/controllers/authentication_controller.dart';

import '../../../../gen/assets.gen.dart';

class AuthenticationBaseScreen extends GetView<AuthenticationController> {
  const AuthenticationBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ColoredBox(
      color: MediaQuery.of(context).orientation == Orientation.landscape
          ? Colors.white
          : AppConfig().colors.backGroundColorSecondary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppConfig().colors.backGroundColorSecondary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Assets.png.logoWhiteBgYellow.image(
                        width: 150,
                        height: 150,
                      ),
                      Gap(AppConfig().dimens.medium),
                      Assets.png.indukoBlue.image(
                        width: 150,
                      ),
                      Gap(AppConfig().dimens.extraLarge),
                    ],
                  ),
                ),
                Gap(AppConfig().dimens.large),
                Text("Share, Inspire,\nCollaborate",
                        style: textTheme.headlineMedium!
                            .copyWith(color: AppConfig().colors.lightBlue),
                        textAlign: TextAlign.center)
                    .paddingSymmetric(horizontal: AppConfig().dimens.medium),
                Gap(AppConfig().dimens.medium),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppStrings.pleaseLoginOrSignUp.tr,
                  style: textTheme.titleMedium!
                      .copyWith(color: AppConfig().colors.lightGrayColor),
                  textAlign: TextAlign.center),
              Gap(AppConfig().dimens.medium),
              CustomIconButton(
                  paddingHorizontal: AppConfig().dimens.medium,
                  color: AppConfig().colors.secondaryColor,
                  txtColor: AppColors().primaryColor,
                  title: AppStrings.login.tr,
                  onTap: () => Get.toNamed(AppConfig().routes.externalAuth)),
              Gap(AppConfig().dimens.medium),
              CustomOutlineIconButton(
                paddingHorizontal: AppConfig().dimens.medium,
                title: AppStrings.signUp.tr,
                onTap: () =>
                    Get.toNamed(AppConfig().routes.registrationFirstStep),
              ),
            ],
          ).paddingOnly(
            left: AppConfig().dimens.medium,
            right: AppConfig().dimens.medium,
            top: AppConfig().dimens.small,
            bottom: MediaQuery.of(context).padding.bottom > 0
                ? MediaQuery.of(context).padding.bottom
                : AppConfig().dimens.medium,
          ),
        ),
      ),
    );
  }
}
