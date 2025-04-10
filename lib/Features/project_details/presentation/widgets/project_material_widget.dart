import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/custom_x_file_model.dart';
import 'package:idealize_new_version/Core/Data/Models/link_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class ProjectMaterialWidget extends StatelessWidget {
  const ProjectMaterialWidget({
    super.key,
    required this.documentFiles,
    required this.mediaFiles,
    required this.downloadFile,
    this.projectLinks = const [],
  });

  final List<CustomXFile> documentFiles;
  final List<CustomXFile> mediaFiles;
  final List<LinkModel>? projectLinks;
  final Function(CustomXFile) downloadFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide(
              color: AppColors().lightGrayColor,
              width: 0.1,
            )),
          ),
          child: documentFiles.isEmpty
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppConfig().dimens.large,
                  ),
                  child: Text(
                    AppStrings.noDocumentFilesAvailable.tr,
                  ),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.documentFiles.tr}:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors().txtColor,
                          ),
                    ).paddingOnly(
                        top: AppConfig().dimens.medium,
                        left: AppConfig().dimens.medium,
                        right: AppConfig().dimens.medium),
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: AppConfig().dimens.medium,
                        bottom: AppConfig().dimens.medium,
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: documentFiles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            documentFiles[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: documentFiles[index].fileColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              documentFiles[index].fileIcon,
                              color: Colors.white,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.cloud_download_rounded,
                              color: AppColors().lightGrayColor,
                            ),
                            onPressed: () => downloadFile(documentFiles[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
        ),
        Gap(AppConfig().dimens.medium),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide(
              color: AppColors().lightGrayColor,
              width: 0.1,
            )),
          ),
          child: mediaFiles.isEmpty
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppConfig().dimens.large,
                  ),
                  child: Text(AppStrings.noMediaAvailable.tr),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.mediaFiles.tr}:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors().txtColor,
                          ),
                    ).paddingOnly(
                        top: AppConfig().dimens.medium,
                        left: AppConfig().dimens.medium,
                        right: AppConfig().dimens.medium),
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: AppConfig().dimens.medium,
                        bottom: AppConfig().dimens.medium,
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: mediaFiles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            mediaFiles[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: mediaFiles[index].fileColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: mediaFiles[index].fileIcon == Icons.image
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: showImageFromNetwork(
                                        mediaFiles[index].uploadedId),
                                  )
                                : Icon(
                                    mediaFiles[index].fileIcon,
                                    color: Colors.white,
                                  ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.cloud_download_rounded,
                              color: AppColors().lightGrayColor,
                            ),
                            onPressed: () => downloadFile(mediaFiles[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
        ),
        Gap(AppConfig().dimens.medium),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide(
              color: AppColors().lightGrayColor,
              width: 0.1,
            )),
          ),
          child: projectLinks!.isEmpty
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppConfig().dimens.large,
                  ),
                  child: Text(AppStrings.noLinksAvailable.tr),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.links.tr}:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors().txtColor,
                          ),
                    ).paddingOnly(
                        top: AppConfig().dimens.medium,
                        left: AppConfig().dimens.medium,
                        right: AppConfig().dimens.medium),
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: AppConfig().dimens.extraSmall,
                        bottom: AppConfig().dimens.medium,
                      ),
                      itemCount: projectLinks?.length ?? 0,
                      itemBuilder: (context, index) {
                        final link = projectLinks![index];

                        return ListTile(
                          onTap: () {
                            link.link.launchURL();
                          },
                          title: Row(
                            children: [
                              Icon(
                                Iconsax.link,
                                color: AppColors().primaryColor,
                              ),
                              Gap(AppConfig().dimens.small),
                              Text(
                                link.label,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors().txtColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            link.link,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors().purpleColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors().purpleColor,
                                decorationThickness: 1),
                            maxLines: 1,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ],
                ),
        ),
        const Gap(50),
      ],
    );
  }
}
