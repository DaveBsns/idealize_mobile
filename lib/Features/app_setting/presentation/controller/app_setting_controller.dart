import 'package:get/get.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../domain/app_setting_repo.dart';

class AppSettingController extends GetxController {
  late AppSettingRepository repo;

  var sliderValue = 1.0.obs;
  var sliderLabel = 'Small'.obs;

  final List<String> deleteAccountoptions = [
    "I want to keep my projects data with my name and delete my account",
    "I want to keep my projects data without my name and delete my account",
    "I want to delete my account and all my projects data",
  ];

  final List<String> languagesOptions = [
    "English",
    "German",
  ];

  RxString selecteddeleteAccountoption = RxString("");
  RxString selectedLanguageOption = RxString("");
  RxBool isDarkMode = false.obs;

  AppSettingController({
    required this.repo,
  });

  @override
  void onReady() {
    super.onReady();
    selectedLanguageOption.value =
        AppRepo().getCurrentLanguageCode == "en" ? "English" : "German";
  }

  void updateSlider(double value) {
    sliderValue.value = value;
    if (value <= 1.0) {
      sliderLabel.value = 'Small';
    } else if (value <= 2.0) {
      sliderLabel.value = 'Medium';
    } else {
      sliderLabel.value = 'Large';
    }
    update();
  }
}
