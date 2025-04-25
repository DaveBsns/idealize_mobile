import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';

class AppFaqScreen extends StatelessWidget {
  const AppFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      appBar: AppBar(
        title: Text(AppStrings.faq.tr),
      ),
      body: Column(
        children: [
          _buildQuestionAnswerBoxWidget(
            AppStrings.faq1.tr,
            AppStrings.faq1A.tr,
          ),
          _buildQuestionAnswerBoxWidget(
            AppStrings.faq2.tr,
            AppStrings.faq2A.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswerBoxWidget(String question, String answer) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(AppConfig().dimens.medium),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
