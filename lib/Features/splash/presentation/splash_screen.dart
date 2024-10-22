import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';

import 'package:idealize_new_version/gen/assets.gen.dart';
import '../data/repo/splash_repo_impl.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({super.key});

  final viewModel = Get.put(
    SplashController(
      repo: SplashRepositoryImpl(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.png.logoWhiteBgYellow.image(
              width: 150,
              height: 150,
            ),
            Gap(AppConfig().dimens.medium),
            Assets.png.indukoWhite.image(
              width: 150,
            ),
            Gap(AppConfig().dimens.extraLarge),
          ],
        ),
      ),
    );
  }
}
