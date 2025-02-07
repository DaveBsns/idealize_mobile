import 'dart:async';

import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Features/delete_account/domain/delete_account_repo.dart';
import 'package:idealize_new_version/app_repo.dart';

class DeleteAccountController extends GetxController {
  late DeleteAccountRepo repo;

  DeleteAccountController({
    required this.repo,
  });

  Rx<int?> selectedDeleteOption = Rx<int?>(null);
  RxString enteredCode = RxString('');
  RxBool isLoadingSendCode = RxBool(false);
  RxBool isLoadingDelete = RxBool(false);
  RxBool isLoadingCheckingProjects = RxBool(false);

  RxBool canSendCode = RxBool(true);
  RxInt timeLeft = RxInt(60);
  Timer? timer;

  RxList<Map<String, dynamic>> projectsMustBeConsider = RxList([]);

  void onChooseDeleteOtion(int? option) => selectedDeleteOption.value = option;
  void goToDeleteWithOption1() {
    Get.toNamed(AppRoutes().deleteAccountOption1);
  }

  void goToDeleteWithOption2() {
    checkDeleteCompletely();
    Get.toNamed(AppRoutes().deleteAccountOption2);
  }

  void sendCodeForAnanymizedDelete() async {
    if (!canSendCode.value) return;

    isLoadingSendCode.value = true;
    canSendCode.value = false;
    final res = await repo.deleteAccountAnanymously();
    isLoadingSendCode.value = false;

    if (res != null) {
      _startTimer();
    }
  }

  void checkDeleteCompletely() async {
    isLoadingCheckingProjects.value = true;
    canSendCode.value = false;
    final res = await repo.deleteAccountCompletely();
    isLoadingCheckingProjects.value = false;

    if (res != null) {
      if (res is String && res == 'otp_sent_success') {
        _startTimer();
      } else if (res is List) {
        projectsMustBeConsider.addAll(res.cast<Map<String, dynamic>>());
      }
    }
  }

  void sendCodeForCompletelyDelete() async {
    if (!canSendCode.value) return;

    isLoadingSendCode.value = true;
    canSendCode.value = false;
    final res = await repo.deleteAccountCompletely();
    isLoadingSendCode.value = false;

    if (res != null) {
      if (res is String && res == 'otp_sent_success') {
        _startTimer();
      } else if (res is List) {
        projectsMustBeConsider.addAll(res.cast<Map<String, dynamic>>());
      }
    }
  }

  void deleteAccountAnanymously() async {
    isLoadingDelete.value = true;
    final res = await repo.deleteAccountAnanymously();

    if (res != null) {
      await AppRepo().logoutUser();
    } else {
      isLoadingDelete.value = false;
    }
  }

  void verifyDelete() async {
    isLoadingDelete.value = true;
    final res = await repo.veryfyDelete(enteredCode.value);
    isLoadingDelete.value = false;

    if (res) {
      AppRepo().showLoading();
      await AppRepo().logoutUser();
    }
  }

  void changeProjectOwner(Map<String, dynamic> project, User newOwner) async {
    AppRepo().showLoading();
    final res = await repo.changeProjectOwner(project['_id'], newOwner.id);
    AppRepo().hideLoading();

    if (res) {
      projectsMustBeConsider
          .removeWhere((element) => element['_id'] == project['_id']);

      Get.back();

      if (projectsMustBeConsider.isEmpty) {
        sendCodeForCompletelyDelete();
      }
    }
  }

  void _startTimer() {
    timeLeft.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        canSendCode.value = true;
        timer.cancel();
      }
    });
  }
}
