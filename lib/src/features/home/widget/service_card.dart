import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/home/models/get_all_type_service_res.dart';

import '../../../../core/components/common_network_image.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, this.service, this.isForSeeMore = false});

  final Service? service;
  final bool isForSeeMore;

  @override
  Widget build(BuildContext context) {
    if (isForSeeMore) {
      return Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.blue,
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 120.h,
            width: double.infinity,
            child: CommonNetworkImage(
              image: service?.thumbnailImage ?? "",
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  service?.title ?? "",
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
          )
        ],
      );
    }
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
            child: CommonNetworkImage(
              image: service?.thumbnailImage ?? "",
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 40,
            child: Text(
              service?.title ?? "",
              textAlign: TextAlign.center,
              style: AppTextStyle.headline.medium.ellipsis,
              maxLines: 2,
            ),
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
              borderRadius: 6,
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
