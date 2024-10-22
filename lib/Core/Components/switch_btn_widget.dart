import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';

class CustomSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppConfig().colors.primaryColor;

    return Switch(
        activeColor: primaryColor,
        inactiveTrackColor: Colors.white,
        activeTrackColor: primaryColor,
        thumbColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return AppColors().lightGrayColor;
          },
        ),
        value: value,
        onChanged: onChanged);
  }
}
