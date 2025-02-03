import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/go_to_top_widget.dart';
import 'package:idealize_new_version/Core/Components/loading_widget.dart';
import 'package:idealize_new_version/Core/Components/project_cards_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';
import 'package:idealize_new_version/app_repo.dart';

class HomeMainListWidget extends GetView<HomeController> {
  const HomeMainListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      initState: (_) => controller.init(),
      builder: (_) => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // TODO change style of the card when there is no internet connection
            Expanded(
              child: Stack(
                children: [
                  if (controller.searchedProjects.isEmpty &&
                      !controller.loading)
                    Center(
                      child: Padding(
                          padding: EdgeInsets.all(
                            AppConfig().dimens.large,
                          ),
                          child: TextButton(
                            onPressed: controller.refreshContent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.emptyList.tr,
                                  style: TextStyle(
                                    color: AppConfig().colors.darkGrayColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Gap(AppConfig().dimens.medium),
                                Icon(
                                  Icons.refresh,
                                  size: 60,
                                  color: AppConfig().colors.secondaryColor,
                                ),
                              ],
                            ),
                          )),
                    ),
                  if (controller.searchedProjects.isNotEmpty)
                    RefreshIndicator(
                      color: AppConfig().colors.primaryColor,
                      onRefresh: controller.refreshContent,
                      child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          itemCount: controller.searchedProjects.length + 1,
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppConfig().dimens.medium),
                          itemBuilder: (context, index) {
                            if (index == controller.searchedProjects.length) {
                              if (controller.searchedProjects.length > 5) {
                                return GoToTopWidget(onTapped: () {
                                  controller.scrollController.animateTo(
                                    0.0,
                                    curve: Curves.easeIn,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                });
                              } else {
                                return const SizedBox.shrink();
                              }
                            } else {
                              final loadingObject = AppRepo()
                                  .updatingProjectsList
                                  .where((element) =>
                                      element ==
                                      controller.searchedProjects[index].id
                                          .toString())
                                  .toList();

                              Widget listItem = ProjectCardHomeWidget(
                                key: Key(
                                    'project_${controller.searchedProjects[index].id}'),
                                project: controller.searchedProjects[index],
                                isLoading: loadingObject.isNotEmpty,
                                onTapOpenProject: () =>
                                    controller.routeToProject(
                                  controller.searchedProjects[index],
                                ),
                                onTapLikeCommentToOpenProject: () =>
                                    controller.routeToProject(
                                  controller.searchedProjects[index],
                                  scrollToComments: true,
                                ),
                                toggleFavorite: controller.toggleArchive,
                              );

                              return listItem;
                            }
                          }),
                    ),
                  if (controller.loading) const CustomLoadingIndicator(),
                  StreamBuilder(
                    stream: AppRepo().networkConnectivityStream.stream,
                    builder: (context, snapshot) =>
                        !AppRepo().networkConnectivity
                            ? Center(
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors().backGroundColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${AppStrings.connectionProblem.tr} ...',
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
