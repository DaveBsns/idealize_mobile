import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';

class TagsContainerWidget extends StatelessWidget {
  final Project? project;
  final List<Tag> tags;
  const TagsContainerWidget({
    super.key,
    required this.tags,
    this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(BorderSide(
          color: AppColors().lightGrayColor,
          width: 0.1,
        )),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tags :",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors().txtColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Gap(AppConfig().dimens.medium),
          Wrap(
            direction: Axis.horizontal,
            spacing: 8.0,
            runSpacing: 0.0,
            children: tags.isNotEmpty
                ? tags
                    .map(
                      (tag) => InkWell(
                        onTap: () {
                          Get.find<HomeController>()
                              .updateFilteredByTag(tag, project);
                          Get.back();
                        },
                        child: Chip(
                          side: BorderSide.none,
                          label: Text(
                            tag.tagName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: AppConfig().colors.greenColor,
                        ),
                      ),
                    )
                    .toList()
                : [
                    Chip(
                      side: BorderSide.none,
                      label: const Text(
                        'No tags for this project',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppConfig().colors.greenColor,
                    )
                  ],
          ),
        ],
      ).paddingAll(AppConfig().dimens.medium),
    );
  }
}
