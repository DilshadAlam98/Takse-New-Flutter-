import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';

import '../../../../core/components/common_network_image.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth * 0.6,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 3, // Blur radius
            offset: const Offset(1, 3), // Shadow position (x, y)
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.blue,
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 120.h,
            width: double.infinity,
            child: const CommonNetworkImage(
              image:
                  "https://cdn.dnaindia.com/sites/default/files/2021/08/11/990042-pan-aadhaar.jpg?im=FitAndFill=(1200,900)",
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "SSC Apply form till date aftereffect",
            textAlign: TextAlign.center,
            style: AppTextStyle.headline.medium.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "120+Application done",
                  style: AppTextStyle.headline.small.regular,
                ),
              ),
              SizedBox(width: 10.h),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.title.large.green,
                  text: "Rs. 26",
                  children: [
                    TextSpan(
                      text: " /100",
                      style: AppTextStyle.title.large.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Flexible(
            child: PrimaryButton(
              height: 40.h,
              text: "Order Now",
              textStyle: AppTextStyle.headline.large.black,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
