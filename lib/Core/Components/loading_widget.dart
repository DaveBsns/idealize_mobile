import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double? stroke;
  const CustomLoadingIndicator({super.key, this.stroke});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white.withOpacity(.4),
      child: Center(
          child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: AppConfig().colors.primaryColor,
          strokeWidth: stroke ?? 4,
        ),
      )),
    );
  }
}
