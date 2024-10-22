import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';

class CustomRow extends StatelessWidget {
  final String lable;
  final String lableValue;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomRow(
      {super.key,
      required this.lable,
      required this.lableValue,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          lable,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        )),
        Gap(AppConfig().dimens.extraLarge),
        Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: lableValue,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppConfig().colors.primaryColor,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
