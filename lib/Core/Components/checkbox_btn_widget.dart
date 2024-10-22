import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';

class CustomCheckboxButton extends StatelessWidget {
  final CustomCheckBoxValue value;
  final VoidCallback onTapped;

  const CustomCheckboxButton(
      {required Key key, required this.value, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? borderColor;

    if (value == CustomCheckBoxValue.checked ||
        value == CustomCheckBoxValue.unchecked) {
      borderColor = AppColors().lightGrayColor;
    } else {
      borderColor = AppColors().redColor;
    }

    return GestureDetector(
      onTap: onTapped,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors().backGroundColor,
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: value == CustomCheckBoxValue.checked
            ? Icon(
                Icons.check,
                size: 16.0,
                color: AppColors().primaryColor,
              )
            : null,
      ),
    );
  }
}
