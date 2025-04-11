import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/app_repo.dart';

class UserForbiddenScreen extends StatefulWidget {
  final String title;
  final String caption;

  const UserForbiddenScreen({
    super.key,
    required this.title,
    required this.caption,
  });

  @override
  State<UserForbiddenScreen> createState() => _UserForbiddenScreenState();
}

class _UserForbiddenScreenState extends State<UserForbiddenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Icon(
                Iconsax.lock_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            const Gap(30),
            Center(
              child: Text(
                widget.title.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(10),
            Center(
              child: Text(
                widget.caption.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const Gap(30),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => Get.offAllNamed(AppRoutes().splash),
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      AppStrings.tryAgain.tr,
                      style: TextStyle(
                        color: AppColors().primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.white.withAlpha(30),
                      thickness: 0.5,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppRepo().logoutUser();
                    },
                    style: TextButton.styleFrom(),
                    child: Text(
                      AppStrings.logout.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
