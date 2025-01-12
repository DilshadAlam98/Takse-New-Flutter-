import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/primary_button.dart';
import '../../../../core/constant/asset_const.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ManageOrderCard extends StatelessWidget {
  const ManageOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetConst.order, width: 30),
              SizedBox(width: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order No.", style: AppTextStyle.title.large.semiBold),
                    Text("B2356", style: AppTextStyle.title.medium.green),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(AssetConst.order1, width: 30),
              SizedBox(width: 5.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "12 Dec 2024 - 10:32 am",
                      style: AppTextStyle.title.large.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(AssetConst.order2, width: 30),
              SizedBox(width: 5.h),
              Text("Rs. 1500.", style: AppTextStyle.title.large),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Image.asset(AssetConst.order3, height: 30),
              SizedBox(width: 10.h),
              Text("Service Name :", style: AppTextStyle.title.large.regular),
              SizedBox(width: 5.h),
              Text("Railway form group-C", style: AppTextStyle.title.large.bold),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AssetConst.order4, height: 30),
              SizedBox(width: 10.h),
              Text("Service Name :", style: AppTextStyle.title.large.regular),
              SizedBox(width: 5.h),
              Text("HOLD", style: AppTextStyle.title.large.deepYellow),
              SizedBox(width: 5.h),
              Flexible(child: Text("(Due to documents incomplete)", style: AppTextStyle.title.large.red)),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  height: 38,
                  elevation: 0,
                  borderRadius: 5,
                  borderColor: AppColors.lightRed,
                  backgroundColor: AppColors.lightRed,
                  text: "Cancel",
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                child: PrimaryButton(
                  elevation: 0,
                  height: 38,
                  borderRadius: 5,
                  borderColor: AppColors.yellow1,
                  backgroundColor: AppColors.yellow1.withOpacity(0.9),
                  text: "Tracking",
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                child: PrimaryButton(
                  text: "Invoice",
                  elevation: 0,
                  height: 38,
                  borderRadius: 5,
                  borderColor: AppColors.skyBlue,
                  backgroundColor: AppColors.skyBlue,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
