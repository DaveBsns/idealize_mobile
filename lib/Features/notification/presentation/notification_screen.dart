import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

import 'controller/notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.notification.tr),
        leading: IconButton(
          onPressed: controller.back,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              controller.clearNotifications();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(AppStrings.clearAll.tr,
                    style: TextStyle(
                        color: AppColors().darkRedColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                Gap(AppConfig().dimens.small),
                Icon(
                  Iconsax.trash,
                  color: AppColors().darkRedColor,
                  size: 24,
                ),
              ],
            ).paddingOnly(right: AppConfig().dimens.large),
          ),
          Expanded(
            child: Obx(() {
              if (controller.notifications.isEmpty) {
                return Center(child: Text(AppStrings.emptyNotification.tr));
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.notifications.length,
                  separatorBuilder: (context, index) =>
                      Gap(AppConfig().dimens.medium),
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.none,
                      width: MediaQuery.sizeOf(context).width,
                      height: _hasActions(index) ? 140 : 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppConfig().dimens.small),
                        border: Border.all(
                          color: AppConfig().colors.lightGrayColor,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: 7,
                              decoration: BoxDecoration(
                                color: _read(index)
                                    ? Colors.transparent
                                    : AppColors().secondaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppConfig().dimens.small),
                                  bottomLeft:
                                      Radius.circular(AppConfig().dimens.small),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Gap(AppConfig().dimens.medium),
                                      Container(
                                        height: 58,
                                        width: 58,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppConfig()
                                                .colors
                                                .lightGrayColor,
                                            width: 1,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: _getProfileImage(index)),
                                      ),
                                      Gap(AppConfig().dimens.medium),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              _notifTitle(index),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize:
                                                    AppConfig().dimens.medium,
                                                fontWeight: FontWeight.bold,
                                                color: AppConfig()
                                                    .colors
                                                    .primaryColor,
                                              ),
                                            ),
                                            Text(
                                              _notifMessage(index),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize:
                                                    AppConfig().dimens.medium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(AppConfig().dimens.medium),
                                      Icon(
                                        controller
                                            .notifications[index].type.toIcon,
                                        size: AppConfig().dimens.large,
                                        color: AppColors().primaryColor,
                                      ),
                                      Gap(AppConfig().dimens.medium),
                                    ],
                                  ),
                                  if (_hasActions(index))
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConfig().dimens.medium),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .responseToProjectRequest(
                                                      action:
                                                          RequestResponseType
                                                              .accepted,
                                                      projectId: controller
                                                          .notifications[index]
                                                          .projectId
                                                          .id,
                                                      notificationId: controller
                                                          .notifications[index]
                                                          .id,
                                                      userId: controller
                                                          .notifications[index]
                                                          .receiver,
                                                      requestType: controller
                                                                  .notifications[
                                                                      index]
                                                                  .type ==
                                                              NotificationType
                                                                  .addTeamMember
                                                          ? 'addTeamMember'
                                                          : 'joinTeamMember');
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors().primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Accept',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: AppConfig()
                                                            .dimens
                                                            .medium,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Gap(AppConfig().dimens.small),
                                                  Icon(Iconsax.tick_circle,
                                                      size: AppConfig()
                                                          .dimens
                                                          .large,
                                                      color: Colors.white),
                                                ],
                                              ).paddingSymmetric(
                                                  horizontal: 10, vertical: 4),
                                            ).paddingOnly(
                                                left: AppConfig().dimens.large,
                                                bottom:
                                                    AppConfig().dimens.medium),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .responseToProjectRequest(
                                                      action:
                                                          RequestResponseType
                                                              .canceled,
                                                      projectId: controller
                                                          .notifications[index]
                                                          .projectId
                                                          .id,
                                                      notificationId: controller
                                                          .notifications[index]
                                                          .id,
                                                      userId: controller
                                                          .notifications[index]
                                                          .receiver,
                                                      requestType: controller
                                                                  .notifications[
                                                                      index]
                                                                  .type ==
                                                              NotificationType
                                                                  .addTeamMember
                                                          ? 'addTeamMember'
                                                          : 'joinTeamMember');
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors().darkRedColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Reject',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: AppConfig()
                                                            .dimens
                                                            .medium,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Gap(AppConfig().dimens.small),
                                                  Icon(Icons.cancel_outlined,
                                                      size: AppConfig()
                                                          .dimens
                                                          .large,
                                                      color: Colors.white),
                                                ],
                                              ).paddingSymmetric(
                                                  horizontal: 10, vertical: 4),
                                            ).paddingOnly(
                                                left: AppConfig()
                                                    .dimens
                                                    .mediumSmall,
                                                right:
                                                    AppConfig().dimens.medium,
                                                bottom:
                                                    AppConfig().dimens.medium),
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(width: 7),
                          ],
                        ),
                      ),
                    );
                  },
                ).paddingAll(AppConfig().dimens.medium);
              }
            }),
          ),
        ],
      ),
    );
  }

  bool _hasActions(index) => (['addTeamMember', 'joinTeamMember']
          .contains(controller.notifications[index].type.value) &&
      !controller.notifications[index].processed);

  bool _read(index) => controller.notifications[index].isRead;

  String _notifMessage(int index) {
    final type = controller.notifications[index].type.value;
    final proccessed = controller.notifications[index].processed;
    if (type == 'addTeamMember' && !proccessed) {
      return 'Request to join project "${controller.notifications[index].projectId.title}"';
    } else if (type == 'joinTeamMember' && !proccessed) {
      return 'Request to join your project "${controller.notifications[index].projectId.title}"';
    } else {
      return controller.notifications[index].message;
    }
  }

  Image _getProfileImage(int index) {
    final notif = controller.notifications[index];
    return notif.sender.getImage();
  }

  String _notifTitle(int index) {
    final type = controller.notifications[index].type.value;
    if (type == 'addTeamMember') {
      return 'Add Team Member';
    } else if (type == 'joinTeamMember') {
      return 'Join Request';
    } else {
      return controller.notifications[index].message;
    }
  }
}
