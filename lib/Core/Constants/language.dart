import '../Data/Models/language_model.dart';

class LanguageConstants {
  List<LanguageModel> languageList = [
    LanguageModel(
      image: "en",
      languageCode: "en",
      languageName: "English",
      countryCode: "EN",
    ),
    LanguageModel(
      image: "de",
      languageCode: "de",
      languageName: "Deutsch",
      countryCode: "DE",
    ),
  ];
  LanguageConstants();
}
