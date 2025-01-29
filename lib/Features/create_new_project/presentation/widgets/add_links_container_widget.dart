import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/link_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AddLinksContainer extends StatelessWidget {
  final Function(LinkModel)? onAddLink;
  final List<LinkModel> links;
  final Function(LinkModel) onLinkDeleted;
  final Function(String)? onLinkNameChanged;
  final Function(String)? onLinkUrlChanged;

  AddLinksContainer({
    super.key,
    this.onAddLink,
    required this.links,
    required this.onLinkDeleted,
    this.onLinkNameChanged,
    this.onLinkUrlChanged,
  });

  final labelCtrl = TextEditingController();
  final linkCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppConfig().colors.backGroundColor,
        borderRadius: BorderRadius.circular(AppConfig().dimens.small),
        border: Border.all(
          color: AppConfig().colors.darkGrayColor,
          width: 0.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Add Links:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Gap(AppConfig().dimens.small),
              GestureDetector(
                onTap: () => AppRepo().showCustomAlertDialog(
                  title: 'Links',
                  content:
                      'Links are optional. You can add links to your project. These will be visible to the user when they view your project.',
                  buttonText: 'OK',
                  buttonTextStyle: TextStyle(
                      color: AppConfig().colors.primaryColor,
                      fontWeight: FontWeight.w700),
                  buttonColor: AppConfig().colors.secondaryColor,
                ),
                child: Icon(
                  Iconsax.info_circle,
                  color: AppConfig().colors.lightGrayColor,
                  size: 22,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  if (labelCtrl.text.isNotEmpty && linkCtrl.text.isNotEmpty) {
                    String? formattedUrl = linkCtrl.text.formatUrl();

                    if (formattedUrl != null &&
                        await canLaunchUrlString(formattedUrl)) {
                      onAddLink?.call(
                          LinkModel(label: labelCtrl.text, link: formattedUrl));

                      labelCtrl.clear();
                      linkCtrl.clear();
                    } else {
                      AppRepo().showSnackbar(
                          label: 'Error', text: 'Please enter a valid URL');
                    }
                  } else {
                    AppRepo().showSnackbar(
                        label: 'Warning', text: 'Please fill all the fields');
                  }
                },
                icon: const Icon(Iconsax.add),
                color: AppConfig().colors.primaryColor,
                iconSize: 28,
              ),
            ],
          ),
          Gap(AppConfig().dimens.large),
          Column(
            children: [
              CustomTextField(
                labelText: "Link name",
                iconColor: AppColors().lightGrayColor,
                keyboardType: TextInputType.url,
                icon: Iconsax.edit_2,
                controller: labelCtrl,
                onChanged: onLinkNameChanged,
              ),
              Center(
                child: SizedBox(
                  height: 15,
                  child: VerticalDivider(
                      color: AppColors().lightGrayColor, thickness: 1.0),
                ),
              ),
              CustomTextField(
                labelText: "Add Url (https://...)",
                keyboardType: TextInputType.url,
                iconColor: AppColors().lightGrayColor,
                icon: Iconsax.edit_2,
                controller: linkCtrl,
                onChanged: onLinkUrlChanged,
              ),
              Gap(AppConfig().dimens.medium),
              Obx(
                () => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.0,
                    runSpacing: 0.0,
                    children: links
                        .map((link) => Chip(
                              side: BorderSide.none,
                              label: Text(
                                link.label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: AppConfig().colors.greenColor,
                              deleteIcon: const Icon(
                                Icons.close,
                                size: 18.0,
                                color: Colors.white,
                              ),
                              onDeleted: () {
                                onLinkDeleted(link);
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        ],
      ).paddingAll(AppConfig().dimens.medium),
    );
  }
}
