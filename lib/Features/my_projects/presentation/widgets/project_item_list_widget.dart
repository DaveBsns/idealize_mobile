import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:idealize_new_version/Core/Components/project_cards_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Components/empty_list_widget.dart';

import 'package:get/get.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

class ProjectItemListWidget extends StatelessWidget {
  final Function(Project)? onTappedDeleteProject;
  final Function(Project)? onTappedOpenProject;
  final Function(Project)? onTappedOpenProjectDetails;
  final Function(Project)? onTappedLikeProject;
  final Function(Project)? onTappedCommentProject;
  final List<Project> projects;
  final bool isEditLabel;

  const ProjectItemListWidget({
    super.key,
    required this.projects,
    this.onTappedDeleteProject,
    this.onTappedOpenProject,
    this.onTappedOpenProjectDetails,
    this.onTappedLikeProject,
    this.onTappedCommentProject,
    this.isEditLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return EmptyListWidget(
        title: AppStrings.emptyDraftProjectMessage.tr,
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: projects.length + 1,
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      separatorBuilder: (context, index) =>
          SizedBox(height: AppConfig().dimens.medium),
      itemBuilder: (context, index) {
        if (index == projects.length) {
          return const Gap(50);
        }
        return InkWell(
          onTap: () {
            onTappedOpenProjectDetails?.call(projects[index]);
          },
          child: ProjectCardMyProjectsWidget(
            onDeleteProject: () => onTappedDeleteProject?.call(projects[index]),
            btnTitle: isEditLabel
                ? AppStrings.editProject.tr
                : AppStrings.openProject.tr,
            project: projects[index],
            onTapLikeProject: () => onTappedLikeProject?.call(projects[index]),
            onTapCommentProject: () =>
                onTappedCommentProject?.call(projects[index]),
            onTapOpenProject: () => onTappedOpenProject?.call(projects[index]),
          ),
        );
      },
    );
  }
}
