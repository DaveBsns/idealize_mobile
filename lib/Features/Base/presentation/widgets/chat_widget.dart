import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Features/Base/domain/entity/chat_entity.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';

class ChatWidget extends StatelessWidget {
  final bool isFirst;
  final ChatEntity chatEntity;

  const ChatWidget({
    super.key,
    required this.isFirst,
    required this.chatEntity,
  });

  @override
  Widget build(BuildContext context) {
    Widget? chat;
    if (chatEntity.isMe) {
      chat = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Get.width * 0.15,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(61, 153, 178, 251),
                  border: Border.all(
                      color: const Color.fromARGB(125, 120, 154, 255),
                      width: 1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  )),
              padding: const EdgeInsets.all(10).copyWith(left: 20),
              child: Text(
                chatEntity.text,
              ),
            ),
          ),
        ],
      );
    } else {
      chat = isFirst
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 38,
                      child: SvgPicture.asset(Assets.svg.robotIcCircle),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF7F8FB),
                          border: Border.all(
                              color: const Color(0xffF5EFF7), width: 1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35),
                          )),
                      padding: const EdgeInsets.all(10).copyWith(right: 35),
                      child: Text(
                        chatEntity.text,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(Assets.svg.ideaIc),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 38,
                  child: SvgPicture.asset(Assets.svg.robotIcCircle),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF7F8FB),
                        border: Border.all(
                            color: const Color(0xffF5EFF7), width: 1),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        )),
                    padding: const EdgeInsets.all(10).copyWith(right: 35),
                    child: Text(
                      chatEntity.text,
                    ),
                  ),
                ),
              ],
            );
    }

    return Padding(
        padding: EdgeInsets.only(top: isFirst ? 0 : 15), child: chat);
  }
}
