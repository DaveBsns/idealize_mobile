import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/register/presentation/controller/register_controller.dart';

class RegistrationCompletedScreen extends GetView<RegisterController> {
  const RegistrationCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppConfig().colors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppStrings.registartionSuccessMsg.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: AppConfig().dimens.large,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: AppConfig().dimens.medium),
            CustomIconButton(
              width: MediaQuery.sizeOf(context).width / 1.5,
              title: AppStrings.startUsingIdealize.tr,
              txtColor: AppConfig().colors.primaryColor,
              onTap: () => Get.offAllNamed(AppConfig().routes.splash),
            )
          ],
        ),
      ),
    );
  }
}
