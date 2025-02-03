import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/group_radio_btn_widget.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../domain/app_setting_repo.dart';

class AppSettingController extends GetxController {
  late AppSettingRepository repo;

  var sliderValue = 1.0.obs;
  var sliderLabel = 'Small'.obs;

  // final List<RadioListItem> deleteAccountoptions = [
  //   RadioListItem(
  //       title:
  //           "I want to keep my projects data with my name and delete my account",
  //       value: 0),
  //   RadioListItem(
  //       title:
  //           "I want to keep my projects data without my name and delete my account",
  //       value: 1),
  //   RadioListItem(
  //       title: "I want to delete my account and all my projects data",
  //       value: 2),
  // ];

  List<RadioListItem> languagesOptions = [
    RadioListItem(title: AppStrings.english.tr, value: 0),
    RadioListItem(title: AppStrings.german.tr, value: 1),
  ];

  RxString selecteddeleteAccountoption = RxString("");
  RxInt selectedLanguageOption = RxInt(0);
  RxBool isDarkMode = false.obs;

  RxList<Map<String, dynamic>> projects = RxList([]);

  AppSettingController({
    required this.repo,
  });

  @override
  void onReady() {
    super.onReady();
    selectedLanguageOption.value =
        AppRepo().getCurrentLanguageCode == "en" ? 0 : 1;
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

  void delete() async {
    projects.clear();
    AppRepo().showLoading();
    final projectsFetched = await repo.deleteAccount();
    AppRepo().hideLoading();

    if (projectsFetched.isNotEmpty) {
      projects.addAll(projectsFetched);
    } else {}
  }
}
