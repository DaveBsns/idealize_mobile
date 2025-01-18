import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/otp_bottom_sheet.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Utils/enums.dart';
import '../../domain/register_repo.dart';
import 'dart:async';
import 'package:idealize_new_version/Core/I18n/messages.dart';

class RegisterController extends GetxController {
  late RegisterRepository repo;

  RegisterController({
    required this.repo,
  });

  bool firstNameCheck = false;
  bool emailCheck = false;
  bool surnameCheck = false;
  bool passwordCheck = false;

  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final reEnterPasswordCtrl = TextEditingController();
  final firstnameCtrl = TextEditingController();
  final surnameCtrl = TextEditingController();
  final imagePicker = ImagePicker();
  final checkboxValue = Rx<CustomCheckBoxValue>(CustomCheckBoxValue.unchecked);

  XFile? image;
  RxString uploadedAvatarId = ''.obs;

  RxBool loading = false.obs;
  RxList<Tag> selectedTags = <Tag>[].obs;
  RxList<Tag> selectedCourses = <Tag>[].obs;
  RxList<Tag> selectedStudyPrograms = <Tag>[].obs;

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  bool isStrongPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
    return passwordRegex.hasMatch(password.trim()) && !password.contains(' ');
  }

  bool arePasswordsSame() {
    return passwordCtrl.text == reEnterPasswordCtrl.text;
  }

  bool areFieldsFilled() {
    return passwordCtrl.text.isNotEmpty &&
        reEnterPasswordCtrl.text.isNotEmpty &&
        firstnameCtrl.text.isNotEmpty &&
        surnameCtrl.text.isNotEmpty &&
        emailCtrl.text.isNotEmpty &&
        checkboxValue.value == CustomCheckBoxValue.checked;
  }

  void showCodeBottomSheet() {
    Get.bottomSheet(
      OtpBottomSheet(
        onCodeSubmitted: (code) async {
          try {
            AppRepo().showLoading();
            final response = await repo.verifyAccount(
              email: emailCtrl.text,
              code: code,
            );
            AppRepo().hideLoading();

            if (response != null) {
              await AppRepo().loginUser(response);
              Get.offAllNamed(AppConfig().routes.registrationSecondStep);
            }
          } on HttpException catch (exception) {
            AppRepo().showSnackbar(
              label: 'Error',
              text: exception.message,
              position: SnackPosition.TOP,
            );
            AppRepo().hideLoading();
          } catch (er) {
            AppRepo().showSnackbar(
              label: 'Error',
              text: er.toString(),
              position: SnackPosition.TOP,
            );
            AppRepo().hideLoading();
          }
        },
        onTappedResendCode: () async {
          AppRepo().showLoading();
          await repo.resendCode(
            email: emailCtrl.text,
          );
          AppRepo().hideLoading();
        },
        onTappedEditInformation: () {
          loading.value = false;
          passwordCtrl.clear();
          reEnterPasswordCtrl.clear();
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

  Future<void> nextStep() async {
    if (!firstNameCheck ||
        !emailCheck ||
        !surnameCheck ||
        !passwordCheck ||
        !arePasswordsSame() ||
        checkboxValue.value != CustomCheckBoxValue.checked) {
      AppRepo().showSnackbar(
        label: 'Error',
        text: AppStrings.fillRequiredFields.tr,
        position: SnackPosition.TOP,
      );
      if (checkboxValue.value != CustomCheckBoxValue.checked) {
        checkboxValue.value = CustomCheckBoxValue.error;
      }
      return;
    }

    _signUp();
  }

  Future<void> selectImageFromGallery() async {
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      image = selectedImage;
      uploadedAvatarId.value = await _uploadAvatar() ?? '';
      update();
    }
  }

  Future<void> takePicture() async {
    final XFile? picture =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (picture != null) {
      image = picture;
      update();
      uploadedAvatarId.value = await _uploadAvatar() ?? '';
    }
  }

  void clearImage() {
    image = null;
    update();
  }

  Future<String?> _uploadAvatar() async {
    if (image == null) return null;
    AppRepo().showLoading();
    final attachedFile = await repo.uploadFile(
      image!.path,
      'image/jpeg'.toMediaType(),
    );
    AppRepo().hideLoading();
    return attachedFile?.id ?? '';
  }

  finish() async {
    AppRepo().showLoading();
    await updateUserProfile();
    AppRepo().hideLoading();
    Get.offAllNamed(AppConfig().routes.registrationComleted);
  }

  Future<void> _signUp() async {
    final password = passwordCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final firstname = firstnameCtrl.text.trim();
    final surname = surnameCtrl.text.trim();

    loading.value = true;
    final response = await repo.createUser(
      email: email,
      firstname: firstname,
      password: password,
      surname: surname,
    );

    if (response != null) {
      showCodeBottomSheet();
    } else {
      loading.value = false;
    }
  }

  Future<void> updateUserProfile() async {
    // final firstname = firstnameCtrl.text;
    // final surname = surnameCtrl.text;
    final username = usernameCtrl.text.trim();

    loading.value = true;
    final response = await repo.updateUser(
      firstname: null,
      surname: null,
      username: username,
      profilePicture:
          uploadedAvatarId.value.isEmpty ? null : uploadedAvatarId.value,
      interstedCourses: selectedCourses.map((element) => element.id).toList(),
      interstedTags: selectedTags.map((element) => element.id).toList(),
      studyPrograms:
          selectedStudyPrograms.map((element) => element.id).toList(),
    );

    if (response != null) {
      Get.replace(AppConfig().routes.splash);
    }
  }

  void cancelOptionalStepsRegistration() {
    AppRepo().showCustomAlertDialog(
      title: "Confirmation Required",
      content:
          "You have the option to skip this steps and add it later in your profile.",
      buttonText: "Okay",
      onPressed: () => Get.offAllNamed(AppConfig().routes.registrationComleted),
      buttonTextStyle: TextStyle(color: AppConfig().colors.primaryColor),
      outlinedButtonText: "Cancel",
      outlinedButtonOnPressed: () => Get.back(),
      buttonColor: AppColors().secondaryColor,
      outlinedButtonColor: Colors.transparent,
      outlinedButtonBorderColor: AppColors().primaryColor,
      outlinedButtonTextStyle:
          TextStyle(color: AppConfig().colors.primaryColor),
    );
  }

  @override
  void onInit() {
    repo.fetchAllTags().then((tags) {
      AppRepo().tags.clear();
      AppRepo().tags.addAll(tags);
    });
    super.onInit();
  }
}
