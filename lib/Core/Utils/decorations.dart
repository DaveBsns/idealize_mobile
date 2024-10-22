import 'package:flutter/material.dart';
import '../Constants/config.dart';

class CustomBoxDecorations {
  static BoxDecoration whiteBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppConfig().dimens.small),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0.5,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
