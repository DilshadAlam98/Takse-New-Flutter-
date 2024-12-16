import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/utils/app_dialog.dart';

class WalletScreens extends StatelessWidget {
  const WalletScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.defaultGrey),
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AssetConst.rewardChutki, height: 50),
                          Column(
                            children: [
                              Text("1500", style: AppTextStyle.headline.large.red.bold),
                              Text("Earn Points", style: AppTextStyle.title.medium.regular),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("1500", style: AppTextStyle.display.copyWith(fontSize: 35, color: AppColors.red)),
                          Text("Current Balance", style: AppTextStyle.title.small),
                        ],
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          AppDialog.showTopUpDialog(
                            onProceed: (amt) {
                              console(amt);
                              Get.back();
                            },
                          );
                        },
                        child: Image.asset(AssetConst.addWallet, height: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.deepYellow,
                                  backgroundImage: const AssetImage(AssetConst.chutki),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Received from", style: AppTextStyle.title.medium.regular),
                                    const SizedBox(height: 3),
                                    Text("Service Name", style: AppTextStyle.title.large.bold),
                                  ],
                                ),
                                const Spacer(),
                                Text("1500", style: AppTextStyle.title.large.bold)
                              ],
                            ),
                            Row(
                              children: [
                                Text("12 Dec 2024 - 10:32 am", style: AppTextStyle.title.medium.regular),
                                const Spacer(),
                                Text("Credited to", style: AppTextStyle.title.medium.regular),
                                const SizedBox(width: 10),
                                Image.asset(AssetConst.coinWallet, height: 30)
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
