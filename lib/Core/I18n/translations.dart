import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/de.dart';
import 'package:idealize_new_version/Core/I18n/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      AppConfig().languages.languageList[0].languageCode: EnLanguageData().keys,
      AppConfig().languages.languageList[1].languageCode: DeLanguageData().keys
    };
  }
}

abstract class LanguageDataKeys {
  Map<String, String> get keys;
}
