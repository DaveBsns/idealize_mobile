import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/project_comment_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';

class CommentContainerWidget extends StatefulWidget {
  final ProjectComment comment;
  final bool isReply;
  final Function(String id)? onTappedReply;
  final Function(String id)? onTappedRemove;

  const CommentContainerWidget({
    super.key,
    required this.comment,
    this.isReply = false,
    this.onTappedReply,
    this.onTappedRemove,
  });

  @override
  State<CommentContainerWidget> createState() => _CommentContainerWidgetState();
}

class _CommentContainerWidgetState extends State<CommentContainerWidget> {
  bool _repliesShown = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _comment,
          if (widget.comment.replies.$1 > 0 && _repliesShown) _replies,
          if (!widget.isReply && widget.comment.replies.$1 > 0)
            InkWell(
                onTap: () {
                  setState(() {
                    _repliesShown = !_repliesShown;
                  });
                },
                child: ColoredBox(
                  color: AppConfig().colors.primaryColor.withOpacity(0.2),
                  child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            textAlign: TextAlign.center,
                            _repliesShown
                                ? AppStrings.showComments.tr
                                : '${AppStrings.showComments.tr} (${widget.comment.replies.$1})'),
                      )),
                )),
        ],
      ),
    );
  }

  Widget get _replies => Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
        child: Column(
          children: widget.comment.replies.$2.map((reply) {
            return Column(
              children: [
                CommentContainerWidget(
                  comment: reply,
                  isReply: true,
                  onTappedReply: null,
                  onTappedRemove: widget.onTappedRemove,
                ),
                if (reply != widget.comment.replies.$2.last)
                  Divider(
                    color: AppColors().lightGrayColor,
                    thickness: 0.2,
                  ),
              ],
            );
          }).toList(),
        ),
      );
  Widget get _comment {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.comment.userId.profilePicture == null
            ? Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppConfig().colors.lightGrayColor,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                  image: widget.comment.userId.profilePicture == null
                      ? DecorationImage(
                          image: AssetImage(
                            Assets.png.placeholderProfile.path,
                          ),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: AssetImage(
                            Assets.png.placeholderProfile.path,
                          ),
                        ),
                ),
              )
            : AppImageLoader(
                imageId: widget.comment.userId.profilePicture!.id,
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                placeholder: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppConfig().colors.primaryColor,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(Assets.png.placeholderProfile.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
        Gap(AppConfig().dimens.small),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${toCamelCase(widget.comment.userId.firstname)} ${toCamelCase(widget.comment.userId.surname)}',
                      style: TextStyle(
                        color: AppColors().txtColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Gap(AppConfig().dimens.small),
                  Text(
                    widget.comment.createdAt.timeAgo(),
                    style: TextStyle(color: AppColors().txtColor, fontSize: 12),
                  ),
                ],
              ),
              Gap(AppConfig().dimens.small),
              AppRepo().user!.id != widget.comment.userId.id
                  ? Text(widget.comment.content)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(widget.comment.content),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: SizedBox(
                            width: 24,
                            child: InkWell(
                              onTap: () {
                                widget.onTappedRemove?.call(widget.comment.id);
                              },
                              child: Icon(
                                Icons.delete,
                                color: AppColors().lightGrayColor,
                                size: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              const Gap(10),
              if (widget.onTappedReply != null)
                InkWell(
                  onTap: () => widget.onTappedReply?.call(widget.comment.id),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Iconsax.messages_3,
                        size: 18,
                        color: AppColors().darkGrayColor,
                      ),
                      Gap(AppConfig().dimens.small),
                      Text(
                        AppStrings.reply.tr,
                        style: TextStyle(
                          color: AppColors().darkGrayColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    ).paddingAll(AppConfig().dimens.small);
  }
}
