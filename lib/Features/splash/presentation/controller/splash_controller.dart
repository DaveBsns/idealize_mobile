import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../domain/splash_repo.dart';

class SplashController extends GetxController {
  late SplashRepository repo;

  SplashController({
    required this.repo,
  });

  Future<void> checkUserStatusFromLocalCache() async {
    final rawUserStatusFromLocalCache = AppRepo()
        .localCache
        .read<int>(AppConfig().localCacheKeys.userLoggedInStatus);

    await Future.delayed(const Duration(seconds: 2));

    switch (rawUserStatusFromLocalCache.toUserStatus()) {
      case UserStatus.loggedIn:
        final userObjectStr = await repo.fetchUserFromLocalCache();

        if (userObjectStr == null) {
          AppRepo().logoutUser();
          break;
        }

        final userObject = User.fromLocalCacheJson(jsonDecode(userObjectStr!));

        AppRepo().user = userObject;
        AppRepo().jwtToken = userObject.token;
        AppRepo().jwtRefreshToken = userObject.refreshToken;

        await AppRepo().refillAllTheData();

        Get.offNamed(AppConfig().routes.base);
        break;
      case UserStatus.loggedOut:
        Get.offNamed(AppConfig().routes.authentication);
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppRepo().setDefaultLocale();
      checkUserStatusFromLocalCache();
    });
  }
}
