import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          TextField(
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
          ),
        ],
      ),
    );
  }
}
