import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/add_new_tag_bottomsheet_widget.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/tag_selector/presentation/controller/tag_selector_controller.dart';

import 'package:idealize_new_version/Core/I18n/messages.dart';

class TagSelectorScreen extends StatelessWidget {
  final String title;
  final List<Tag> initialChipData;
  final List<Tag> initialSelectedChipData;
  final Function(List<Tag>)? onChipSelectedList;
  final VoidCallback? onTapedSavedButton;
  final TagType tagType;
  final int? limit;

  TagSelectorScreen({
    super.key,
    required this.title,
    required this.initialChipData,
    required this.initialSelectedChipData,
    required this.tagType,
    this.onChipSelectedList,
    this.onTapedSavedButton,
    this.limit,
  });

  final controller = Get.put(TagSelectorController());

  @override
  Widget build(BuildContext context) {
    controller.init(
      initialChipDataList: initialChipData,
      initialSelectedChipDataList: initialSelectedChipData,
      typeValue: tagType,
    );

    TextTheme textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title.replaceAll(':', ''),
          style: textStyles.titleLarge,
        ),
      ),
      body: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: SizedBox(
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: AppConfig().dimens.medium.allPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(AppConfig().dimens.small),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CustomSearchField(
                        secondIcon: Iconsax.search_normal_14,
                        labelText: AppStrings.search.tr,
                        controller: controller.searchCtrl,
                        onChanged: controller.search,
                      ),
                    ),
                    Gap(AppConfig().dimens.medium),
                    Expanded(
                      child: controller.tags.value.isNotEmpty
                          ? SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: controller.tags.value.map((entry) {
                                  bool isSelected = controller
                                          .selectedTags.value
                                          .indexWhere((element) =>
                                              element.id == entry.id) >
                                      -1;

                                  return ChoiceChip(
                                    checkmarkColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: isSelected
                                            ? (tagType == TagType.studyProgram
                                                ? AppConfig().colors.lightBlue
                                                : AppConfig().colors.greenColor)
                                            : AppConfig().colors.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          AppConfig().dimens.small),
                                    ),
                                    selectedColor:
                                        tagType == TagType.studyProgram
                                            ? AppConfig().colors.lightBlue
                                            : AppConfig().colors.greenColor,
                                    label: Text(entry.tagName),
                                    labelStyle: isSelected
                                        ? textStyles.titleMedium!
                                            .copyWith(color: Colors.white)
                                        : textStyles.titleMedium!.copyWith(
                                            color: AppConfig()
                                                .colors
                                                .primaryColor),
                                    selected: isSelected,
                                    onSelected: (bool selected) {
                                      _updateTagSelection(entry, selected);
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.info_circle,
                                    size: 70,
                                    color: Colors.grey[400],
                                  ),
                                  Gap(AppConfig().dimens.small),
                                  Text(
                                    AppStrings.emptyHere.tr,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Gap(AppConfig().dimens.extraLarge),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AddNewTagBottomsheetWidget(
                                          onAddedTagName: controller.addNewTag,
                                          tagName: controller.searchCtrl.text,
                                        ),
                                      );
                                    },
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: '${AppStrings.click.tr} ',
                                        style: textStyles.titleMedium!.copyWith(
                                          color:
                                              AppConfig().colors.lightGrayColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '"${AppStrings.here.tr}"',
                                            style: textStyles.titleMedium!
                                                .copyWith(
                                              color: AppConfig()
                                                  .colors
                                                  .secondaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: AppConfig()
                                                  .colors
                                                  .secondaryColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ${AppStrings.toAddNew.trParams({
                                                  'name': tagType == TagType.tag
                                                      ? AppStrings.tag.tr
                                                      : (tagType ==
                                                              TagType.course
                                                          ? AppStrings.course.tr
                                                          : (tagType ==
                                                                  TagType
                                                                      .studyProgram)
                                                              ? AppStrings
                                                                  .studyProgram
                                                                  .tr
                                                              : '')
                                                })}',
                                            style: textStyles.titleMedium!
                                                .copyWith(
                                              color: AppConfig()
                                                  .colors
                                                  .lightGrayColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    Gap(AppConfig().dimens.medium),
                    CustomIconButton(
                      color: AppConfig().colors.secondaryColor,
                      title: AppStrings.save.tr,
                      txtColor: AppColors().primaryColor,
                      onTap: () {
                        Get.back();
                        onTapedSavedButton?.call();
                      },
                    ),
                    Gap(AppConfig().dimens.medium),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get _tagName {
    switch (tagType) {
      case TagType.tag:
        return AppStrings.tag.tr;
      case TagType.course:
        return AppStrings.course.tr;
      case TagType.studyProgram:
        return AppStrings.studyProgram.tr;
    }
  }

  void _updateTagSelection(Tag tag, bool isSelected) {
    if (isSelected) {
      if (limit != null) {
        if (controller.selectedTags.value.length >= limit!) {
          Get.snackbar(
            AppStrings.warning.tr,
            AppStrings.pickMoreThan3Error
                .trParams({'count': limit.toString(), 'name': _tagName}),
          );
          return;
        }
      }

      controller.selectedTags.value.add(tag);
    } else {
      controller.selectedTags.value.removeWhere((elem) => elem.id == tag.id);
    }

    controller.selectedTags.refresh();

    onChipSelectedList?.call(controller.selectedTags);
  }
}
