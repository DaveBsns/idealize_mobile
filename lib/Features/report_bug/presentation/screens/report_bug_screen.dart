import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/report_bug/presentation/controller/report_bug_controller.dart';

class ReportBugScreen extends GetView<ReportBugController> {
  const ReportBugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.reportBug.tr),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              AppStrings.reportBugContent.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const Gap(20),
            CustomMultiLineTextField(
              controller: controller.bugDescCtrl,
              labelText: AppStrings.reportBugDesc.tr,
              maxLines: 7,
              maxCharcters: 500,
            ),
            const Spacer(),
            SafeArea(
              top: false,
              bottom: true,
              maintainBottomViewPadding: true,
              child: CustomIconButton(
                  title: AppStrings.submit.tr,
                  onTap: () {
                    controller.submit();
                  },
                  txtColor: AppConfig().colors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
