import 'package:idealize_new_version/Core/Constants/dimens.dart';
import 'package:idealize_new_version/Core/Constants/language.dart';
import 'package:idealize_new_version/Core/Constants/local_cache_keys.dart';
import 'package:idealize_new_version/Core/Constants/text_styles.dart';
import 'package:idealize_new_version/Core/Constants/themes.dart';
import './colors.dart';
import './routes.dart';

class AppConfig {
  static final AppConfig _singleton = AppConfig._internal();
  factory AppConfig() => _singleton;
  AppConfig._internal();

  String get baseURL => "http://localhost:3000/api";
  String get baseFileUrl => "http://localhost:3000";
  String get chatBotServer => "http://localhost:3000/chat";

  String get termsCondiftionsUrl => "https://localhost:4200/terms";
  String get privacyPolicyUrl => "https://localhost:4200/privacy";

  double get textRatio => 1.0;
  final baseLocale = LanguageConstants().languageList[0];

  final routes = AppRoutes();
  final colors = AppColors();
  final themes = AppThemes();
  final localCacheKeys = LocalCacheKeys();
  final localSecureCacheKeys = LocalSecureCacheKeys();
  final languages = LanguageConstants();
  final dimens = Dimens();

  AppTextStyles styles(double ration) => AppTextStyles(ratio: ration);
}
