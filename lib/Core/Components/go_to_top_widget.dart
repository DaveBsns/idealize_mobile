import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class GoToTopWidget extends StatelessWidget {
  final VoidCallback onTapped;
  const GoToTopWidget({super.key, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Center(
          child: Padding(
        padding: AppConfig().dimens.medium.bottomPadding,
        child: Column(
          children: [
            Icon(
              Icons.keyboard_arrow_up,
              color: AppConfig().colors.darkGrayColor,
              size: 20,
            ),
            Text(
              'Back to top',
              style: TextStyle(
                fontSize: 12,
                color: AppConfig().colors.darkGrayColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ).paddingSymmetric(vertical: AppConfig().dimens.medium),
      )),
    );
  }
}
