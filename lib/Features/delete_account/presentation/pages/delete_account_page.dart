import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/delete_account/presentation/controller/delete_account_controller.dart';

class DeleteAccountPage extends GetView<DeleteAccountController> {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.deleteAccount.tr),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Obx(
                () => Column(
                  children: [
                    Text(
                      AppStrings.deleteAccountDesc.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.5,
                      ),
                    ),
                    const Gap(20),
                    RadioListTile(
                      value: 1,
                      groupValue: controller.selectedDeleteOption.value,
                      onChanged: controller.onChooseDeleteOtion,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        AppStrings.deleteAccountDescOption1.tr,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Gap(20),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 2,
                      groupValue: controller.selectedDeleteOption.value,
                      onChanged: controller.onChooseDeleteOtion,
                      title: Text(
                        AppStrings.deleteAccountDescOption2.tr,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 24,
                right: 24,
              ),
              child: Obx(
                () => CustomIconButton(
                  title: AppStrings.next.tr,
                  onTap: controller.selectedDeleteOption.value == null
                      ? null
                      : (() {
                          if (controller.selectedDeleteOption.value == 1) {
                            controller.goToDeleteWithOption1();
                          } else {
                            controller.goToDeleteWithOption2();
                          }
                        }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
