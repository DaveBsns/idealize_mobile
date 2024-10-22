import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/project_comment_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';

class CommentContainerWidget extends StatefulWidget {
  final ProjectComment comment;
  final bool isReply;
  final VoidCallback? onTappedReply;

  const CommentContainerWidget({
    super.key,
    required this.comment,
    this.isReply = false,
    this.onTappedReply,
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
                                ? 'Hide comments'
                                : 'Show comments (${widget.comment.replies.$1})'),
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
                ),
                if (reply != widget.comment.replies.$2.last)
                  Divider(color: AppColors().lightGrayColor),
              ],
            );
          }).toList(),
        ),
      );
  Widget get _comment {
    return Row(
      children: [
        widget.comment.userId.profilePicture == null
            ? Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppConfig().colors.lightGrayColor,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                  image: widget.comment.userId.profilePicture == null
                      ? null
                      : DecorationImage(
                          image: AssetImage(
                            Assets.png.placeholderProfile.path,
                          ),
                        ),
                ),
              )
            : AppImageLoader(
                imageId: widget.comment.userId.profilePicture!.id,
                height: 58,
                width: 58,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                placeholder: Container(
                  height: 58,
                  width: 58,
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
        Gap(AppConfig().dimens.medium),
        Expanded(
          child: Column(
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
                  Gap(AppConfig().dimens.medium),
                  Text(
                    widget.comment.createdAt.timeAgo(),
                    style: TextStyle(color: AppColors().txtColor, fontSize: 12),
                  ),
                ],
              ),
              Gap(AppConfig().dimens.extraSmall),
              Text(widget.comment.content),
              const Gap(18),
              if (widget.onTappedReply != null)
                InkWell(
                  onTap: widget.onTappedReply,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Iconsax.messages_3,
                        size: 22,
                        color: AppColors().darkGrayColor,
                      ),
                      Gap(AppConfig().dimens.small),
                      Text(
                        'Reply',
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
    ).paddingAll(AppConfig().dimens.medium);
  }
}
