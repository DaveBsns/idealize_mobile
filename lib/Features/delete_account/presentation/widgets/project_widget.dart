import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';

class ProjectMustBeDeleteWidget extends StatelessWidget {
  final Function(User newOwner) onOwnerChanged;
  final Map<String, dynamic> project;

  const ProjectMustBeDeleteWidget({
    super.key,
    required this.project,
    required this.onOwnerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().primaryColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(12.5).copyWith(bottom: 3, top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              project['title'],
              style: TextStyle(
                color: AppColors().primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12.5),
                          child: SafeArea(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Gap(10),
                                  Text(
                                    AppStrings.pickMember.tr,
                                    style: TextStyle(
                                      color: AppColors().primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const Gap(20),
                                  Column(
                                    children: [
                                      for (final User user
                                          in project['members'])
                                        InkWell(
                                          onTap: () {
                                            onOwnerChanged(user);
                                          },
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(12.5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                              bottom: BorderSide(
                                                color: AppColors()
                                                    .lightGrayColor
                                                    .withOpacity(0.2),
                                                width: 1,
                                              ),
                                            )),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: user.profilePicture
                                                              ?.id !=
                                                          null
                                                      ? showImageFromNetwork(
                                                          user.profilePicture
                                                                  ?.id ??
                                                              '',
                                                          placeholder: Assets
                                                              .png
                                                              .placeholderProfile
                                                              .image(
                                                            width: 24,
                                                            height: 24,
                                                          ),
                                                          width: 24,
                                                          height: 24,
                                                        )
                                                      : Assets.png
                                                          .placeholderProfile
                                                          .image(
                                                          width: 24,
                                                          height: 24,
                                                        ),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  '${user.firstname} ${user.surname}',
                                                  style: TextStyle(
                                                    color: AppColors()
                                                        .primaryColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                ]),
                          ));
                    });
              },
              icon: Icon(
                Iconsax.profile_2user,
                color: AppColors().primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
