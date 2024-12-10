import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Features/Base/base_viewmodel.dart';
import 'package:idealize_new_version/Features/Base/presentation/widgets/chat_widget.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';

class ChatScreen extends GetView<BaseViewModel> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: controller.chats.stream,
              builder: (_, __) {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  scrollDirection: Axis.vertical,
                  controller: controller.scrollCtrl,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.chats.length,
                  itemBuilder: (context, index) => ChatWidget(
                    isFirst: index == 0,
                    chatEntity: controller.chats.value[index],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImageLoader(
                    height: 55,
                    width: 55,
                    imageId: AppRepo().user?.profilePicture?.id ?? '',
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    placeholder: Container(
                      height: 55,
                      width: 55,
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.aiIsResponding.value)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                'AI is responding...',
                                style: TextStyle(
                                  color: AppConfig().colors.lightGrayColor,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          CustomTextField(
                            labelText: 'Write Message',
                            radius: 50,
                            maxLines: 5,
                            minLines: 1,
                            textInputAction: TextInputAction.send,
                            onEditingComplete: controller.onTappedSendMessage,
                            controller: controller.messageCtrl,
                            enabled: !controller.aiIsResponding.value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget get _appbar => AppBar(
        title: const Text("Chat"),
        leading: IconButton(
          onPressed: Get.back,
          icon: SvgPicture.asset(Assets.svg.arrowBackIc),
        ),
        actions: [
          IconButton(
            onPressed: controller.onTappedMoreButton,
            icon: SvgPicture.asset(Assets.svg.moreVerticalIc),
          )
        ],
      );
}
