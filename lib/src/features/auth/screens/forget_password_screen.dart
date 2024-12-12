import 'package:flutter/material.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';

import '../../../../core/components/primary_button.dart';
import '../../../../core/theme/app_text_style.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      resizeToAvoidBottomInset: false,
      primary: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(AssetConst.loginBG, height: 400),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset(AssetConst.chutkiWithText, width: 330),
                  const SizedBox(height: 5),
                  Text(
                    'SELECT USER TYPE',
                    style: AppTextStyle.headline.large.deepYellow.regular,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: "Continue",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _youtubeButtons({required VoidCallback onTap, required String label}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(AssetConst.youtube, width: 40),
          Text(label, style: AppTextStyle.title.medium.regular),
        ],
      ),
    );
  }
}
