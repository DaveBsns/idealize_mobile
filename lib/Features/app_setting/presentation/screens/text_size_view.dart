import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Features/app_setting/presentation/controller/app_setting_controller.dart';

import 'package:idealize_new_version/Core/I18n/messages.dart';

class TextSizeView extends GetView<AppSettingController> {
  const TextSizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.textSize.tr),
      ),
      body: Column(
        children: [
          const Gap(20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('A', style: TextStyle(fontSize: 12)),
              Text('A', style: TextStyle(fontSize: 18)),
              Text('A', style: TextStyle(fontSize: 24)),
            ],
          ).paddingOnly(
              left: AppConfig().dimens.medium,
              right: AppConfig().dimens.medium),
          GetBuilder<AppSettingController>(
            builder: (controller) => SliderTheme(
              data: SliderTheme.of(context).copyWith(
                tickMarkShape: const RoundSliderTickMarkShape(
                  tickMarkRadius: 4.0,
                ),
                disabledActiveTickMarkColor: Colors.white,
                disabledInactiveTickMarkColor: Colors.white,
                activeTickMarkColor: const Color.fromARGB(255, 218, 216, 214),
              ),
              child: Slider(
                value: controller.sliderValue.value,
                onChanged: (value) {
                  controller.updateSlider(value);
                },
                min: 1.0,
                max: 3.0,
                divisions: 2,
                thumbColor: AppColors().primaryColor,
                overlayColor: WidgetStateColor.resolveWith(
                    (states) => AppColors().primaryColor.withOpacity(0.5)),
                activeColor: AppColors().primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
