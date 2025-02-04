import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/home/controller/home_controller.dart';

import '../../../../core/local/app_session.dart';
import '../../../../core/routes/route_const.dart';
import '../../../utils/app_dialog.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.yellow1,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Image.asset(AssetConst.takseMall),
          ),
          const SizedBox(height: 20),
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User Name",
                                  style: AppTextStyle.title.large,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  controller.accountRes?.user?.userPersonalDetail?.name ?? "",
                                  style: AppTextStyle.title.large.lightWeight,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User Type",
                                  style: AppTextStyle.title.large,
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 30,
                                  // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(color: AppColors.borderColor),
                                  ),
                                  child: Text(
                                    controller.accountRes?.user?.role?.name ?? "",
                                    style: AppTextStyle.title.large.lightWeight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Number",
                                  style: AppTextStyle.title.large,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  controller.accountRes?.user?.mobileNumber ?? "",
                                  style: AppTextStyle.title.large.lightWeight,
                                ),
                              ],
                            ),
                            PrimaryButton(
                              borderRadius: 6,
                              width: 150,
                              text: "Need Trial",
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      AppTextField(
                        controller: controller.couponCodeController,
                        hintText: "Enter Coupon Code",
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.validateCoupon();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            color: AppColors.yellow1,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(3),
                              topRight: Radius.circular(3),
                            ),
                          ),
                          child: Text("Apply", style: AppTextStyle.headline.large),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    borderColor: AppColors.green,
                    backgroundColor: AppColors.green,
                    textStyle: AppTextStyle.headline.large.white,
                    text: "Pay Now ${controller.registrationFee}",
                    onPressed: () {
                      controller.payNow();
                    },
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    borderColor: AppColors.red,
                    backgroundColor: AppColors.red,
                    textStyle: AppTextStyle.headline.large.white,
                    text: "Logout",
                    onPressed: () async {
                      await AppSession().clearPreference();
                      AppDialog.showSuccessSnackBar(message: "Logout successfully");
                      Get.offAndToNamed(RouteConst.verifyNo);
                    },
                  ),
                  const SizedBox(height: 60),
                  Image.asset(AssetConst.youtube, height: 60),
                  Text("क्यों पेमेंट करे ?", style: AppTextStyle.title.medium)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

interface class A {}

class B implements A {}
