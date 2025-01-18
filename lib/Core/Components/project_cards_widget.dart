import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/loading_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class ProjectCardHomeWidget extends StatelessWidget {
  final Project project;
  final bool isLoading;
  final VoidCallback? onTapOpenProject;
  final VoidCallback? onTapLikeCommentToOpenProject;
  final Function(bool, Project)? toggleFavorite;

  const ProjectCardHomeWidget({
    super.key,
    required this.project,
    required this.isLoading,
    this.toggleFavorite,
    this.onTapOpenProject,
    this.onTapLikeCommentToOpenProject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      clipBehavior: Clip.none,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConfig().dimens.small),
        border: Border.all(
          color: AppConfig().colors.lightGrayColor,
          width: 0.3,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppConfig().dimens.medium,
          right: AppConfig().dimens.medium,
          bottom: AppConfig().dimens.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Iconsax.calendar_1,
                    size: 18, color: AppConfig().colors.primaryColor),
                Gap(AppConfig().dimens.extraSmall),
                Expanded(
                  child: Text(
                    project.createdAt.toString().isEmpty
                        ? 'Unknown'
                        : project.createdAt.toFullDate(),
                  ),
                ),
                IconButton(
                  icon: isLoading
                      ? const SizedBox(
                          width: 10,
                          height: 10,
                          child: CustomLoadingIndicator(stroke: 2))
                      : Icon(
                          project.isArchived ?? false
                              ? Icons.bookmark
                              : Icons.bookmark_add_outlined,
                          color: project.isArchived ?? false
                              ? AppConfig().colors.purpleColor
                              : AppConfig().colors.purpleColor,
                        ),
                  onPressed: () {
                    if (!isLoading) {
                      if (toggleFavorite != null) {
                        toggleFavorite!(
                            !(project.isArchived ?? false), project);
                      }
                    }
                  },
                ),
              ],
            ),
            Text(
              project.title.isNotEmpty ? project.title : AppStrings.noTitle.tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppConfig().colors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: AppConfig().dimens.medium,
              ),
            ),
            Gap(AppConfig().dimens.extraSmall),
            Wrap(
              spacing: AppConfig().dimens.extraSmall,
              runSpacing: AppConfig().dimens.small,
              children: project.tags.isEmpty
                  ? <Widget>[const SizedBox.shrink()]
                  : project.tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppConfig().colors.greenColor,
                              borderRadius: BorderRadius.circular(
                                  AppConfig().dimens.extraSmall),
                            ),
                            child: Text(
                              tag.tagName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))
                      .toList(),
            ),
            Gap(AppConfig().dimens.small),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  project.description.isEmpty
                      ? 'No description'
                      : project.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppConfig().colors.darkGrayColor,
                  ),
                )),
              ],
            ),
            Gap(AppConfig().dimens.medium),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTapLikeCommentToOpenProject?.call();
                    },
                    child: CustomIconText(
                      likes: project.likes,
                      comments: project.comments,
                    ),
                  ),
                ),
                CustomOutlineIconButton(
                  width: 170,
                  height: 45,
                  onTap: onTapOpenProject,
                  title: AppStrings.openProject.tr,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// we used this widget to show project cards in the My Projects page to show user projects, with this card user can open the project, delete the project, and see the project details
class ProjectCardMyProjectsWidget extends StatelessWidget {
  final Project project;
  final VoidCallback? onTapOpenProject;
  final String? btnTitle;
  final VoidCallback? onDeleteProject;

  const ProjectCardMyProjectsWidget({
    super.key,
    required this.project,
    required this.btnTitle,
    this.onTapOpenProject,
    this.onDeleteProject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConfig().dimens.small),
        border: Border.all(
          color: AppConfig().colors.lightGrayColor,
          width: 0.3,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppConfig().dimens.medium,
          right: AppConfig().dimens.medium,
          bottom: AppConfig().dimens.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Iconsax.calendar_1,
                    size: 18, color: AppConfig().colors.primaryColor),
                Gap(AppConfig().dimens.extraSmall),
                Expanded(
                  child: Text(
                    project.createdAt.toString().isEmpty
                        ? 'Unknown'
                        : project.createdAt.toFullDate(),
                  ),
                ),
                IconButton(
                    onPressed: onDeleteProject,
                    icon: Icon(
                      Iconsax.trash,
                      color: AppConfig().colors.darkGrayColor,
                    ))
              ],
            ),
            Text(
              project.title.isNotEmpty ? project.title : "No title",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppConfig().colors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: AppConfig().dimens.medium,
              ),
            ),
            Gap(AppConfig().dimens.extraSmall),
            Wrap(
              spacing: AppConfig().dimens.extraSmall,
              runSpacing: AppConfig().dimens.small,
              children: project.tags.isEmpty
                  ? <Widget>[const SizedBox.shrink()]
                  : project.tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppConfig().colors.greenColor,
                              borderRadius: BorderRadius.circular(
                                  AppConfig().dimens.extraSmall),
                            ),
                            child: Text(
                              tag.tagName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))
                      .toList(),
            ),
            Gap(AppConfig().dimens.small),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  project.description.isEmpty
                      ? 'No description'
                      : project.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppConfig().colors.darkGrayColor,
                  ),
                )),
              ],
            ),
            Gap(AppConfig().dimens.medium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: CustomIconText(
                  comments: project.comments,
                  likes: project.likes,
                )),
                CustomOutlineIconButton(
                  width: 150,
                  height: 45,
                  onTap: onTapOpenProject,
                  title: btnTitle!,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomIconText extends StatelessWidget {
  final int comments;
  final int likes;

  const CustomIconText({
    super.key,
    required this.comments,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.like_1,
          size: 20,
          color: AppConfig().colors.darkGrayColor,
        ),
        Gap(AppConfig().dimens.extraSmall),
        Flexible(
          child: Text(
            '$likes',
            style: TextStyle(
              color: AppConfig().colors.darkGrayColor,
            ),
          ),
        ),
        Gap(AppConfig().dimens.medium),
        Icon(
          Iconsax.messages_3,
          size: 20,
          color: AppConfig().colors.darkGrayColor,
        ),
        Gap(AppConfig().dimens.extraSmall),
        Flexible(
          child: Text(
            '$comments',
            style: TextStyle(
              color: AppConfig().colors.darkGrayColor,
            ),
          ),
        ),
      ],
    );
  }
}
