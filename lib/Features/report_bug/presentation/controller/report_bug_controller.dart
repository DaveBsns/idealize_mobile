import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/report_bug/domain/report_bug_repo.dart';
import 'package:idealize_new_version/app_repo.dart';

class ReportBugController extends GetxController {
  late ReportBugRepo repo;

  ReportBugController({required this.repo});

  final bugDescCtrl = TextEditingController();

  Future<void> submit() async {
    // if (bugDescCtrl.text.length < 100) {
    //   AppRepo().showSnackbar(
    //     label: AppStrings.warning.tr,
    //     text: AppStrings.descriptionWaring.tr,
    //   );

    //   return;
    // }

    if (bugDescCtrl.text.isEmpty) {
      AppRepo().showSnackbar(
        label: AppStrings.warning.tr,
        text: AppStrings.reportBugDescEmpty.tr,
      );
      return;
    }

    AppRepo().showLoading();
    final res = await repo.reportBug(bugDesc: bugDescCtrl.text);
    AppRepo().hideLoading();

    if (res != null) {
      bugDescCtrl.text = '';
      AppRepo().showSnackbar(
        label: AppStrings.reportedSuccessTitle.tr,
        text: AppStrings.reportedSuccessDesc.tr,
      );
    }
  }
}
