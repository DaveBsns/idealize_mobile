import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

class HomeNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChangedMenu;
  const HomeNavigationBar(
      {super.key, required this.currentIndex, required this.onChangedMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            onChangedMenu(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppConfig().colors.secondaryColor,
          unselectedItemColor: AppConfig().colors.darkGrayColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Lato',
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Lato',
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.home),
              label: AppStrings.home.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.add_circle),
              label: AppStrings.addProjekt.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.user),
              label: AppStrings.profile.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.setting_2),
              label: AppStrings.settings.tr,
            ),
          ],
        ),
      ),
    );
  }
}
