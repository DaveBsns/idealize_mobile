import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/Base/base_viewmodel.dart';

class CreateNewProjectCompletedScreen extends StatelessWidget {
  const CreateNewProjectCompletedScreen({super.key});

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
              AppStrings.projectSuccesfullyCreated.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: AppConfig().dimens.large,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: AppConfig().dimens.medium),
            Column(
              children: [
                CustomIconButton(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  title: AppStrings.backToHome.tr,
                  txtColor: AppConfig().colors.primaryColor,
                  onTap: () {
                    final baseViewModel = Get.find<BaseViewModel>();
                    baseViewModel.updateNavigationIndex(0);
                    Get.close(2);
                  },
                ),
                Gap(AppConfig().dimens.medium),
                CustomOutlineIconButton(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  title: AppStrings.createNewProject.tr,
                  onTap: () {
                    Get.close(1);
                  },
                  borderColor: const Color.fromARGB(255, 82, 81, 81),
                  txtColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
