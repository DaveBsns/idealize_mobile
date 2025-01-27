import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:idealize_new_version/Core/Components/project_cards_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Components/empty_list_widget.dart';

class ProjectItemListWidget extends StatelessWidget {
  final Function(Project)? onTappedDeleteProject;
  final Function(Project)? onTappedOpenProject;
  final List<Project> projects;
  final bool isEditLabel;

  const ProjectItemListWidget({
    super.key,
    required this.projects,
    this.onTappedDeleteProject,
    this.onTappedOpenProject,
    this.isEditLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const EmptyListWidget(
        title: "You don't have any draft projects yet.",
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
        return ProjectCardMyProjectsWidget(
          onDeleteProject: () => onTappedDeleteProject?.call(projects[index]),
          btnTitle: isEditLabel ? "Edit Project" : "Open Project",
          project: projects[index],
          onTapOpenProject: () => onTappedOpenProject?.call(projects[index]),
        );
      },
    );
  }
}
