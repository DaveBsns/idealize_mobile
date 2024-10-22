import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/text_styles.dart';

class AppThemes {
  ThemeData light({double ratio = 1.0}) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: AppTextStyles(ratio: ratio).title,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors().primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: AppColors().primaryColor,
          ),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppConfig().colors.backGroundColor),
      );
}
