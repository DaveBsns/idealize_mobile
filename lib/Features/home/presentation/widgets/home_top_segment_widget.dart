import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';

class HomeTopSegmentWidget extends GetView<HomeController> {
  const HomeTopSegmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      initState: (_) => controller.init(),
      builder: (_) => SizedBox(
        // height: 40,
        width: MediaQuery.sizeOf(context).width,
        child: SegmentedButton<int>(
          showSelectedIcon: false,
          multiSelectionEnabled: false,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return AppConfig().colors.primaryColor;
                }
                return Colors.white;
              },
            ),
            side: WidgetStateProperty.resolveWith<BorderSide>(
              (Set<WidgetState> states) {
                return BorderSide(
                    color: AppConfig().colors.lightGrayColor.withOpacity(0.5),
                    width: 1.1);
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return Colors.black;
              },
            ),
            iconColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.black;
                }
                return AppConfig().colors.primaryColor;
              },
            ),
            // maximumSize: MaterialStateProperty.resolveWith<Size>(
            //   (Set<MaterialState> states) {
            //     if (states.contains(MaterialState.selected)) {
            //       return const Size(400, 50);
            //     }
            //     return const Size(400, 50);
            //   },
            // ),
            // minimumSize: MaterialStateProperty.resolveWith<Size>(
            //   (Set<MaterialState> states) {
            //     if (states.contains(MaterialState.selected)) {
            //       return const Size(400, 50);
            //     }
            //     return const Size(400, 50);
            //   },
            // ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          segments: [
            ButtonSegment<int>(
                value: 0,
                label: Text(
                  AppStrings.newHome.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            ButtonSegment<int>(
                value: 1,
                label: Text(
                  AppStrings.forYou.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            ButtonSegment<int>(
                value: 2,
                label: Text(
                  AppStrings.weeklyTrend.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
          selected: {controller.selectedValue},
          onSelectionChanged: controller.updateSegmentValue,
        ),
      ),
    );
  }
}
