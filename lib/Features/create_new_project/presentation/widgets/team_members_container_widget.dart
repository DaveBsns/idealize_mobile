import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/team_members_selector_btmsheet_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/app_repo.dart';

import 'package:get/get.dart';

import 'package:idealize_new_version/Core/I18n/messages.dart';

class TeamMembersContainerWidget extends StatelessWidget {
  final List<User> selectedUsers;
  final Function(List<User>) onUsersChanged;
  final List<User> allUsers;

  const TeamMembersContainerWidget({
    super.key,
    required this.selectedUsers,
    required this.onUsersChanged,
    required this.allUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        clipBehavior: Clip.none,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppConfig().colors.backGroundColor,
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
                      spacing: 10.0,
                      runSpacing: 0.0,
                      children: [
                        Text(
                          AppStrings.teamMembers.tr + " :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () => AppRepo().showCustomAlertDialog(
                            title: AppStrings.dailogAddTeamMemberTitle.tr,
                            content: AppStrings.dailogAddTeamMemberContent.tr,
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
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext context) {
                          return TeamMembersSelectorBottomSheetWidget(
                            selectedChipData: selectedUsers,
                            chipData: allUsers,
                            onChipSelectedList: (newList) {
                              onUsersChanged(newList);
                            },
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Iconsax.add_circle,
                      size: 28,
                      color: AppColors().primaryColor,
                    ),
                  ),
                ],
              ),
              selectedUsers.isNotEmpty
                  ? Gap(AppConfig().dimens.small)
                  : const SizedBox.shrink(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 0.0,
                  children: selectedUsers
                      .map((selectedUser) => Chip(
                            side: BorderSide.none,
                            label: Text(
                              '${selectedUser.firstname} ${selectedUser.surname}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: (selectedUser.pendingUser ?? false)
                                ? AppConfig().colors.lightGrayColor
                                : AppConfig().colors.greenColor,
                            deleteIcon: const Icon(
                              Icons.close,
                              size: 18.0,
                              color: Colors.white,
                            ),
                            onDeleted: () {
                              selectedUsers.removeWhere(
                                  (elem) => elem.id == selectedUser.id);
                              onUsersChanged(List.from(selectedUsers));
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
