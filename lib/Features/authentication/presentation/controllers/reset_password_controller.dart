import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/app_repo.dart';
import '../../../../Core/Components/otp_bottom_sheet.dart';
import '../../../../Core/Constants/config.dart';
import '../../domain/reset_password_repository.dart';
import 'dart:async';

import 'package:idealize_new_version/Core/I18n/messages.dart';

class ResetPasswordController extends GetxController {
  late ResetPasswordRepository repo;

  String code = '';
  String email = '';

  RxBool isPassword = RxBool(true);
  RxBool loading = RxBool(false);

  ResetPasswordController({
    required this.repo,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  void resetPasswordRequest() async {
    loading.value = false;

    if (emailController.text.isNotEmpty && emailController.text.isEmail) {
      AppRepo().showLoading();
      final result = await repo.resetPasswordRequest(emailController.text);
      AppRepo().hideLoading();
      if (result != null) {
        Get.back();
        await Future.delayed(const Duration(seconds: 1));
        showCodeBottomsheet();
      }
    } else {
      AppRepo().hideLoading();
      AppRepo().showSnackbar(
          label: AppStrings.error.tr,
          text: AppStrings.enterValidEmail.tr,
          position: SnackPosition.TOP);
    }
  }

  Future<void> showCodeBottomsheet() async {
    Get.bottomSheet(
      OtpBottomSheet(
        onCodeSubmitted: (newCode) async {
          code = newCode;
          email = emailController.text;
          Get.back();
          Get.toNamed(AppConfig().routes.resetPassword);
        },
        onTappedResendCode: () async {
          resetPasswordRequest();
        },
        onTappedEditInformation: () {
          Get.back();
        },
      ),
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void reset() async {
    if (email.isEmpty || !email.isEmail) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: AppStrings.enterValidEmail.tr,
        position: SnackPosition.TOP,
      );
      return;
    }

    if (code.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: AppStrings.enterCodePassword.tr,
        position: SnackPosition.TOP,
      );
      return;
    }

    if (passwordController.text != rePasswordController.text) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: AppStrings.passIsNotMatch.tr,
        position: SnackPosition.TOP,
      );
      return;
    }

    try {
      AppRepo().showLoading();
      final response = await repo.resetPasswordVerify(
        emailController.text,
        code,
        passwordController.text,
      );
      AppRepo().hideLoading();

      if (response != null) {
        AppRepo().showSnackbar(
          label: AppStrings.success.tr,
          text: AppStrings.passIsReset.tr,
          position: SnackPosition.TOP,
        );
        await Future.delayed(const Duration(seconds: 3));
        Get.offAllNamed(AppConfig().routes.splash);
      }
    } on HttpException catch (exception) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: exception.message,
        position: SnackPosition.TOP,
      );
      AppRepo().hideLoading();
    } catch (er) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: er.toString(),
        position: SnackPosition.TOP,
      );
      AppRepo().hideLoading();
    }
  }
}
