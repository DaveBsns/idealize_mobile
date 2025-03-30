import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Features/authentication/domain/authentication_repository.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../../../Core/Components/otp_bottom_sheet.dart';

class AuthenticationController extends GetxController {
  late AuthenticationRepository repo;

  AuthenticationController({
    required this.repo,
  });

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final isPassword = true.obs;

  RxBool loading = false.obs;

  Future<void> signIn() async {
    if (loading.value) return;

    final username = usernameCtrl.text;
    final password = passwordCtrl.text;

    if (username.isEmpty || password.isEmpty) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: AppStrings.isEmpty.tr,
        position: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!username.isEmail) {
      AppRepo().showSnackbar(
        label: AppStrings.error.tr,
        text: AppStrings.enterValidEmail.tr,
        position: SnackPosition.BOTTOM,
      );
      return;
    }

    loading.value = true;
    final response = await repo.login(username: username, password: password);

    if (response != null &&
        response.keys.isNotEmpty &&
        response.keys.first == 'custom-response' &&
        response['custom-response'] ==
            ServiceHelperCustomResponse.activateAccount) {
      loading.value = false;
      showCodeBottomSheet();
      return;
    }

    if (response != null) {
      await AppRepo().loginUser(response);
      Get.offAllNamed(AppConfig().routes.base);
    } else {
      loading.value = false;
    }
  }

  void showCodeBottomSheet() {
    Get.bottomSheet(
      OtpBottomSheet(
        onCodeSubmitted: (code) async {
          try {
            AppRepo().showLoading();
            final response = await repo.verifyAccount(
              email: usernameCtrl.text,
              code: code,
            );
            AppRepo().hideLoading();

            if (response != null) {
              await AppRepo().loginUser(response);
              Get.offAllNamed(AppConfig().routes.base);
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
        },
        onTappedResendCode: () async {
          await signIn();
        },
        onTappedEditInformation: () {
          loading.value = false;
          passwordCtrl.clear();
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
}
