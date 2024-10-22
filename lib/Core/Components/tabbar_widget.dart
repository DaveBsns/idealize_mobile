import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.tabs = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          for (int i = 0; i < tabs.length; i++) _buildTab(i, tabs[i]),
        ],
      ),
    ).paddingAll(AppConfig().dimens.medium);
  }

  Expanded _buildTab(int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: Container(
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? AppConfig().colors.primaryColor
                : Colors.white,
            borderRadius: index == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
            border: Border.all(
              color: AppConfig().colors.lightGrayColor,
              width: 0.4,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: selectedIndex == index
                    ? Colors.white
                    : AppColors().primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
