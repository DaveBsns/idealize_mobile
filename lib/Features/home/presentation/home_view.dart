import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';
import 'package:idealize_new_version/Features/home/presentation/widgets/home_main_list_widget.dart';
import 'package:idealize_new_version/Features/home/presentation/widgets/home_top_segment_widget.dart';
import 'package:idealize_new_version/Features/home/presentation/widgets/home_topbar_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConfig().dimens.medium,
        right: AppConfig().dimens.medium,
        top: AppConfig().dimens.medium,
      ),
      child: Column(
        children: [
          const HomeTopBarWidget(),
          Gap(AppConfig().dimens.medium),
          const HomeTopSegmentWidget(),
          Gap(AppConfig().dimens.medium),
          const HomeMainListWidget(),
        ],
      ),
    );
  }
}
