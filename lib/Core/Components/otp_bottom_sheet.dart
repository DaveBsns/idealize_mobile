import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'dart:async';

import 'package:idealize_new_version/Core/Constants/config.dart';

class OtpController extends GetxController {
  var code = List.filled(4, '').obs;
  var timeLeft = 120.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timeLeft.value = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void onDigitEntered(int index, String value) {
    if (value.isNotEmpty &&
        value.length == 1 &&
        value.contains(RegExp(r'^\d$'))) {
      code[index] = value;
      if (index < 3) {
        Get.focusScope?.nextFocus();
      }
    } else if (value.isEmpty) {
      code[index] = '';
      if (index > 0) {
        Get.focusScope?.previousFocus();
      }
    } else {
      code[index] = '';
    }
  }

  bool isCodeComplete() {
    return code.every((digit) => digit.isNotEmpty);
  }

  bool isButtonEnabled() {
    return isCodeComplete() && timeLeft.value > 0;
  }

  String getCode() {
    return code.join();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class OtpBottomSheet extends StatelessWidget {
  final Function(String code) onCodeSubmitted;
  final VoidCallback onTappedResendCode;
  final VoidCallback onTappedEditInformation;

  const OtpBottomSheet({
    super.key,
    required this.onCodeSubmitted,
    required this.onTappedResendCode,
    required this.onTappedEditInformation,
  });

  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    return Obx(() => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter 4-digit Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Gap(AppConfig().dimens.medium),
              Text("Enter the 4-digit code that you received via email.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppConfig().colors.lightGrayColor,
                  ),
                  textAlign: TextAlign.center),
              Gap(AppConfig().dimens.extraLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      controller:
                          TextEditingController(text: controller.code[index]),
                      onChanged: (value) =>
                          controller.onDigitEntered(index, value),
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      cursorColor: AppConfig().colors.primaryColor,
                      decoration: InputDecoration(
                        counterText: '',
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppConfig().colors.lightGrayColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppConfig().colors.primaryColor,
                              width: 1.4),
                        ),
                      ),
                    ),
                  );
                }),
              ).paddingSymmetric(horizontal: 30),
              Gap(AppConfig().dimens.large),
              Obx(() => Text('Time left: ${controller.timeLeft.value}s',
                  style: TextStyle(
                      color: AppConfig().colors.txtColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))),
              const Gap(85),
              Obx(() => CustomIconButton(
                    title: "Weiter",
                    onTap: controller.isButtonEnabled()
                        ? () {
                            String code = controller.getCode();

                            onCodeSubmitted(code);
                          }
                        : null,
                    txtColor: AppConfig().colors.primaryColor,
                  )),
              TextButton(
                onPressed: () {
                  controller.startTimer();
                  onTappedResendCode();
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: AppConfig().colors.txtColor),
                    children: <TextSpan>[
                      const TextSpan(text: "Didn’t receive code?  "),
                      TextSpan(
                        text: "resend code",
                        style: TextStyle(
                            color: AppConfig().colors.secondaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onTappedEditInformation(),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: AppConfig().colors.txtColor),
                    children: <TextSpan>[
                      const TextSpan(text: "Edit information?  "),
                      TextSpan(
                        text: "Edit",
                        style: TextStyle(
                            color: AppConfig().colors.secondaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
