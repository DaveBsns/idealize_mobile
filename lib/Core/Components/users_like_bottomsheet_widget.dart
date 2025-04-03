import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Data/Models/project_comment_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class UserslikeBottomSheet extends StatelessWidget {
  final List<ProjectLikes> likes;

  const UserslikeBottomSheet({
    super.key,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: AppConfig().dimens.medium.allPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(11),
                Center(
                  child: Text(
                    AppStrings.likes.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors().txtColor),
                  ),
                ),
                Gap(AppConfig().dimens.medium),
                // TODO - Shayan
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: likes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: showImageFromNetwork(
                                  likes[index].user.profilePicture?.id ?? '',
                                ),
                              ),
                            ),
                            Gap(AppConfig().dimens.small),
                            Text(
                              '${likes[index].user.firstname} ${likes[index].user.surname}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
