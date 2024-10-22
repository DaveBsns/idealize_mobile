import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';
import '../Constants/config.dart';

class CustomStepperWidget extends StatelessWidget {
  final int stepCount;
  final int activeStep;
  final Color backgroundColor;

  const CustomStepperWidget({
    super.key,
    required this.backgroundColor,
    required this.stepCount,
    required this.activeStep,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Row(
        children: List<Widget>.generate(stepCount, (index) {
          return Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color:
                    index < activeStep ? AppColors().primaryColor : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }).expand((widget) => [widget, Gap(AppConfig().dimens.small)]).toList()
          ..removeLast(),
      ).paddingSymmetric(vertical: AppConfig().dimens.large),
    );
  }
}
