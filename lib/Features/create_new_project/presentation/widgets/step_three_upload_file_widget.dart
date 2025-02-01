import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/custom_x_file_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Core/Utils/file_utils.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import 'package:idealize_new_version/app_repo.dart';

import 'package:idealize_new_version/Core/I18n/messages.dart';

class StepThreeUploadFilewidget extends GetView<CreateNewProjectController> {
  const StepThreeUploadFilewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.none,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors().backGroundColor,
            borderRadius: BorderRadius.circular(AppConfig().dimens.small),
            border: Border.all(
              color: AppConfig().colors.darkGrayColor,
              width: 0.3,
            ),
          ),
          child: Padding(
            padding: AppConfig().dimens.medium.allPadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 10.0,
                        runSpacing: 0.0,
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            AppStrings.files.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => AppRepo().showCustomAlertDialog(
                              title: AppStrings.fileUploadInfo.tr,
                              content: AppStrings.uploadInformation.tr,
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
                        ],
                      ),
                    ),
                    Gap(AppConfig().dimens.small),
                    Flexible(
                      fit: FlexFit.tight,
                      child: CustomOutlineIconButton(
                        title: AppStrings.uploadFiles.tr,
                        icon: const Icon(Iconsax.add),
                        width: 160,
                        height: 50,
                        onTap: () {
                          controller.pickGeneralFile();
                        },
                      ),
                    ),
                  ],
                ),
                GetBuilder<CreateNewProjectController>(
                  builder: (controller) {
                    final List<CustomXFile> otherFiles = [
                      ...controller.attachments
                          .where((attachment) =>
                              !FileUtils.isMediaFile(attachment.mimeType))
                          .map((e) => CustomXFile(
                                uploadedId: e.id,
                                name: e.filename,
                                path: e.path,
                                mediaType: e.mimeType.toMediaType(),
                                isUploadedMedia: true,
                              )),
                      ...controller.files,
                    ];

                    return Column(
                      children: [
                        ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.only(top: AppConfig().dimens.medium),
                          itemCount: otherFiles.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(otherFiles[index].name, maxLines: 1),
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: otherFiles[index].fileColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  otherFiles[index].fileIcon,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  if (otherFiles[index].isUploadedMedia) {
                                    AppRepo().showCustomAlertDialog(
                                      onPressed: () {
                                        controller.deleteProjectMaterial(
                                            controller.attachments
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    otherFiles[index]
                                                        .uploadedId)
                                                .id);
                                      },
                                      title: AppStrings.deleteMaterial.tr,
                                      content: AppStrings
                                          .sureAboutDeletingMaterial.tr,
                                      buttonText: AppStrings.delete.tr,
                                      buttonTextStyle: TextStyle(
                                          color:
                                              AppConfig().colors.primaryColor,
                                          fontWeight: FontWeight.w700),
                                      buttonColor:
                                          AppConfig().colors.secondaryColor,
                                      outlinedButtonBorderColor:
                                          AppColors().primaryColor,
                                      outlinedButtonOnPressed: () => Get.back(),
                                      outlinedButtonText: AppStrings.cancel.tr,
                                      outlinedButtonColor: Colors.transparent,
                                      outlinedButtonTextStyle: TextStyle(
                                          color:
                                              AppConfig().colors.primaryColor,
                                          fontWeight: FontWeight.w700),
                                    );
                                  } else {
                                    controller.files.removeWhere((element) =>
                                        element.path == otherFiles[index].path);
                                  }
                                  controller.update();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Gap(AppConfig().dimens.medium),
        Container(
          clipBehavior: Clip.none,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors().backGroundColor,
            borderRadius: BorderRadius.circular(AppConfig().dimens.small),
            border: Border.all(
              color: AppConfig().colors.darkGrayColor,
              width: 0.3,
            ),
          ),
          child: Padding(
            padding: AppConfig().dimens.medium.allPadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 10.0,
                        runSpacing: 0.0,
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            AppStrings.media.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => AppRepo().showCustomAlertDialog(
                              title: AppStrings.fileUploadInfo.tr,
                              content: AppStrings.uploadInformation.tr,
                              buttonText: AppStrings.okay.tr,
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
                        ],
                      ),
                    ),
                    Gap(AppConfig().dimens.small),
                    Flexible(
                      fit: FlexFit.tight,
                      child: CustomOutlineIconButton(
                        title: AppStrings.uploadMedia.tr,
                        icon: const Icon(Iconsax.add),
                        width: 160,
                        height: 50,
                        onTap: () {
                          controller.pickMediaFile();
                        },
                      ),
                    ),
                  ],
                ),
                GetBuilder<CreateNewProjectController>(
                  builder: (controller) {
                    final mediaFiles = [
                      ...controller.attachments
                          .where((attachment) =>
                              FileUtils.isMediaFile(attachment.mimeType))
                          .map((e) => CustomXFile(
                                uploadedId: e.id,
                                name: e.filename,
                                path: e.path,
                                mediaType: e.mimeType.toMediaType(),
                                isUploadedMedia: true,
                              )),
                      ...controller.mediaFiles
                    ];

                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: AppConfig().dimens.medium,
                      ),
                      itemCount: mediaFiles.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(mediaFiles[index].name, maxLines: 1),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: mediaFiles[index].fileColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              mediaFiles[index].fileIcon,
                              color: Colors.white,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              if (mediaFiles[index].isUploadedMedia) {
                                AppRepo().showCustomAlertDialog(
                                  onPressed: () {
                                    controller.deleteProjectMaterial(
                                        controller.attachments[index].id);
                                  },
                                  title: AppStrings.deleteMaterial.tr,
                                  content:
                                      AppStrings.sureAboutDeletingMaterial.tr,
                                  buttonText: AppStrings.delete.tr,
                                  buttonTextStyle: TextStyle(
                                      color: AppConfig().colors.primaryColor,
                                      fontWeight: FontWeight.w700),
                                  buttonColor:
                                      AppConfig().colors.secondaryColor,
                                  outlinedButtonBorderColor:
                                      AppColors().primaryColor,
                                  outlinedButtonOnPressed: () => Get.back(),
                                  outlinedButtonText: AppStrings.cancel.tr,
                                  outlinedButtonColor: Colors.transparent,
                                  outlinedButtonTextStyle: TextStyle(
                                      color: AppConfig().colors.primaryColor,
                                      fontWeight: FontWeight.w700),
                                );
                              } else {
                                controller.mediaFiles.removeWhere((element) =>
                                    element.path == mediaFiles[index].path);
                              }
                              controller.update();
                            },
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
        Gap(AppConfig().dimens.medium),
        Obx(
          () => Container(
            clipBehavior: Clip.none,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors().backGroundColor,
              borderRadius: BorderRadius.circular(AppConfig().dimens.small),
              border: Border.all(
                color: AppConfig().colors.darkGrayColor,
                width: 0.3,
              ),
            ),
            child: Padding(
              padding: AppConfig().dimens.medium.allPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          children: [
                            Text(
                              AppStrings.thumbnail.tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () => AppRepo().showCustomAlertDialog(
                                title: AppStrings.fileUploadInfo.tr,
                                content: AppStrings.uploadInformation.tr,
                                buttonText: AppStrings.okay.tr,
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
                          ],
                        ),
                      ),
                      Gap(AppConfig().dimens.small),
                      Flexible(
                        fit: FlexFit.tight,
                        child: CustomOutlineIconButton(
                          title: AppStrings.uploadThumbnail.tr,
                          icon: const Icon(Iconsax.add),
                          width: 160,
                          height: 50,
                          onTap: () {
                            controller.pickThumbnail();
                          },
                        ),
                      ),
                    ],
                  ),
                  _uploadedFile
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _uploadedFile {
    final file = controller.pickedThumbnail.value;

    if (file == null) {
      return const SizedBox();
    }

    return ListTile(
      title: null,
      leading: SizedBox(
        height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            File(file.path),
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.cancel,
          color: Colors.grey,
        ),
        onPressed: () {
          controller.pickedThumbnail.value = null;
        },
      ),
    );
  }
}
