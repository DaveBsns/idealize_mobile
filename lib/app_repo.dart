import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/dialog_alert_widget.dart';
import 'package:idealize_new_version/Core/Components/snackbar_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/LocalCache/local_cache_helper.dart';
import 'package:idealize_new_version/Core/Data/LocalCache/local_secure_cache_helper.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/save_project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Data/Services/tags_service.dart';
import 'package:idealize_new_version/Core/Data/Services/user_service.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppRepo {
  static final AppRepo _singleton = AppRepo._internal();
  factory AppRepo() => _singleton;
  AppRepo._internal();

  // Private Resources
  bool isGlobalLoadingOn = false;

  //  Internal Resources
  final localCache = LocalCacheHelper();
  final secureLocalCache = LocalSecureCacheHelper();
  bool networkConnectivity = true;
  RxList<int> networkConnectivityStream = RxList<int>([]);

  // External Resources
  User? user;
  String? jwtToken;
  String? jwtRefreshToken;
  List<SavedProject> savedProjectsList = [];
  List<String> updatingProjectsList = [];
  List<Tag> tags = [];
  List<User> users = [];

  final CustomSnackbar customSnackbar = CustomSnackbar(
    label: '',
    text: '',
  );


  String getProjectFileUrl(ProjectFile? file) {
    if (file != null) {
      return file.id;
    } else {
      return '';
    }
  }

  void toggleLanguage() {
    final languageCode =
        LocalCacheHelper().read(AppConfig().localCacheKeys.appLanguage) ??
            AppConfig().baseLocale.languageCode;

    final currentLanguageIndex = AppConfig()
        .languages
        .languageList
        .indexWhere((element) => element.languageCode == languageCode);

    final nextLanguageIndex = currentLanguageIndex == 0 ? 1 : 0;

    setNewLocale(
        AppConfig().languages.languageList[nextLanguageIndex].languageCode);
  }

  void setNewLocale(String languageCode) {
    LocalCacheHelper()
        .write(AppConfig().localCacheKeys.appLanguage, languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  void setDefaultLocale() {
    var languageCode =
        LocalCacheHelper().read(AppConfig().localCacheKeys.appLanguage);

    if (languageCode == null) {
      languageCode = AppConfig().baseLocale.languageCode;
      LocalCacheHelper()
          .write(AppConfig().localCacheKeys.appLanguage, languageCode);
    }

    Get.updateLocale(Locale(languageCode));
  }

  String get getCurrentLanguageCode =>
      LocalCacheHelper().read(AppConfig().localCacheKeys.appLanguage) ??
      AppConfig().baseLocale.languageCode;

  bool get isLoadingOn => isGlobalLoadingOn;

  void showLoading() {
    if (!Get.context!.loaderOverlay.visible) {
      Get.context?.loaderOverlay.show();
    }
  }

  Future<void> hideLoading() async {
    if (Get.context!.loaderOverlay.visible) {
      Get.context?.loaderOverlay.hide();
    }
  }

  void showSnackbar({
    required String label,
    required String text,
    IconData icon = Icons.info,
    Color? backgroundColor,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
    TextStyle labelStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    ),
    TextStyle textStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
  }) {
    Get.closeAllSnackbars();
    CustomSnackbar(
      label: label,
      text: text,
      icon: icon,
      backgroundColor: backgroundColor ?? AppConfig().colors.primaryColor,
      textColor: textColor,
      duration: duration,
      position: position,
      labelStyle: labelStyle,
      textStyle: textStyle,
    ).show();
  }

  void showCustomAlertDialog({
    required String title,
    required String content,
    required String buttonText,
    VoidCallback? onPressed,
    required Color buttonColor,
    required TextStyle buttonTextStyle,
    String? outlinedButtonText,
    VoidCallback? outlinedButtonOnPressed,
    Color outlinedButtonColor = Colors.blue,
    Color outlinedButtonBorderColor = Colors.blue,
    TextStyle outlinedButtonTextStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  }) {
    if (Get.context == null) return;

    Get.dialog(
      CustomAlertDialogWidget(
        title: title,
        content: content,
        buttonText: buttonText,
        buttonColor: buttonColor,
        buttonTextStyle: buttonTextStyle,
        onPressed: onPressed ?? () => Get.back(),
        outlinedButtonText: outlinedButtonText,
        outlinedButtonOnPressed: outlinedButtonOnPressed,
        outlinedButtonColor: outlinedButtonColor,
        outlinedButtonBorderColor: outlinedButtonBorderColor,
        outlinedButtonTextStyle: outlinedButtonTextStyle,
      ),
    );
  }

  Future<void> refillAllTheData() async {
    // Fetch user's saved projects before entring the app
    AppRepo().savedProjectsList.clear();
    // AppRepo().savedProjectsList.addAll(await ProjectService()
    //     .fetchSavedProjects(AppRepo().user?.id.toString() ?? ''));

    AppRepo().tags.clear();
    AppRepo().tags.addAll(await TagService().fetchAllTags());

    AppRepo().users.clear();
    AppRepo().users.addAll(await UserService().fetchAllUsers());
    AppRepo().users.removeWhere((element) => element.id == AppRepo().user?.id);
  }

  Future<void> logoutUser() async {
    showLoading();

    await AppRepo().localCache.clear();
    user = null;
    jwtToken = null;
    savedProjectsList.clear();
    updatingProjectsList.clear();
    tags.clear();
    users.clear();

    await Future.delayed(const Duration(seconds: 2));
    AppRepo().hideLoading();

    Get.offAllNamed(AppConfig().routes.splash);
  }

  Future<bool> loginUser(Map<String, dynamic> response) async {
    /* Update localCache based on Server data */
    user = User.fromJson(response);
    jwtToken = user!.token;
    jwtRefreshToken = user!.refreshToken;
    await secureLocalCache.write(
      AppConfig().localSecureCacheKeys.userObject,
      jsonEncode(response),
    );

    AppRepo().localCache.write(
          AppConfig().localCacheKeys.userLoggedInStatus,
          UserStatus.loggedIn.toLocalCacheInt(),
        );

    await AppRepo().refillAllTheData();
    return true;
  }
}
