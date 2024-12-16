import 'package:flutter/material.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';

import '../../../../core/components/app_divider.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Text("How to Use Application", style: AppTextStyle.headline.medium, textAlign: TextAlign.start),
              ),
            ),
            Image.asset(AssetConst.trainingBG, height: 250),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AssetConst.chutki, height: 35),
                        const SizedBox(width: 6),
                        Text("Featured Video", style: AppTextStyle.headline.medium.red.bold),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.defaultGrey.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: AppColors.defaultGrey.withOpacity(0.8), blurRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(AssetConst.registerBG, height: 200),
                                AppDivider(color: AppColors.black, height: 30),
                                Text("Title Here", style: AppTextStyle.title.medium.bold),
                                const SizedBox(height: 10)
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
