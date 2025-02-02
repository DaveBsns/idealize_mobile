import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

class AddNewTagBottomsheetWidget extends StatelessWidget {
  final Function(String tagName) onAddedTagName;
  final String tagName;

  const AddNewTagBottomsheetWidget({
    super.key,
    required this.onAddedTagName,
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    final tagNameCtrl = TextEditingController(text: tagName);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: SizedBox(
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: AppConfig().dimens.medium.allPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Gap(
                AppConfig().dimens.medium,
              ),
              Text(AppStrings.addNewTag.tr),
              Gap(AppConfig().dimens.small),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomTextField(
                  labelText: "${AppStrings.tagName.tr}...",
                  icon: null,
                  controller: tagNameCtrl,
                ),
              ),
              Gap(
                AppConfig().dimens.medium,
              ),
              CustomIconButton(
                title: AppStrings.add.tr,
                onTap: () {
                  if (tagNameCtrl.text.isEmpty) {
                    AppRepo().showSnackbar(
                      label: AppStrings.error.tr,
                      text: AppStrings.tagNameValid.tr,
                    );
                  } else {
                    onAddedTagName(tagNameCtrl.text);
                  }
                },
              ),
              Gap(
                AppConfig().dimens.medium,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
