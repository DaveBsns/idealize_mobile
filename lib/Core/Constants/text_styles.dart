import 'package:flutter/material.dart';

class AppTextStyles {
  final double ratio;

  AppTextStyles({required this.ratio});

  TextStyle get title => TextStyle(fontSize: (20 * ratio));
}
