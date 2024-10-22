import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final List<String> items;
  final Function(String)? onSelectedItem;
  final String? initialValue;
  const CustomDropdownWidget(
      {super.key, required this.items, this.onSelectedItem, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownMenu<String>(
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          expandedInsets: const EdgeInsets.all(0),
          dropdownMenuEntries: [
            for (final item in items)
              DropdownMenuEntry<String>(
                value: item,
                label: item.toString(),
              ),
          ],
          onSelected: (String? value) {
            if (onSelectedItem != null && value != null) {
              onSelectedItem!(value);
            }
          },
          initialSelection: initialValue ?? items.first,
          menuStyle: MenuStyle(
              backgroundColor:
                  WidgetStateColor.resolveWith((states) => Colors.white))),
    );
    //AppConfig().colors.primaryColor),
  }
}
