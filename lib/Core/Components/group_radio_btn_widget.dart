import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';

class CustomRadioGroup extends StatelessWidget {
  final List<dynamic> radioList;
  final Function(dynamic) onSelect;
  final dynamic selected;
  final dynamic scrollDirection;
  const CustomRadioGroup({
    super.key,
    required this.radioList,
    required this.onSelect,
    required this.selected,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemBuilder: (c, i) => RadioListTile(
          activeColor: AppColors().primaryColor,
          title: Row(
            children: [
              // SvgPicture.asset('assets/uk_flag.svg', width: 24, height: 24),

              Expanded(
                child: Text(
                  radioList[i],
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          value: radioList[i],
          groupValue: selected,
          onChanged: (v) => onSelect(v)),
      separatorBuilder: (c, i) => const Divider(),
      itemCount: radioList.length);
}
