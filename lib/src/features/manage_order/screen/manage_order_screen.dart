import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/src/features/manage_order/controller/manage_order_manage.dart';

import '../../../../core/components/common_appbar.dart';
import '../../../../core/theme/app_text_style.dart';

class ManageOrderScreen extends GetView<ManageOrderController> {
  const ManageOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Manage Order"),
      body: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AssetConst.closedMail, width: 40),
                SizedBox(width: 5.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order No.", style: AppTextStyle.title.large.semiBold),
                    Text("B2356", style: AppTextStyle.title.medium.green),
                  ],
                ),
                const Spacer(),
                Image.asset(AssetConst.closedMail, width: 40),
                SizedBox(width: 5.h),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(AssetConst.closedMail, width: 40),
                SizedBox(width: 5.h),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order No."),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
