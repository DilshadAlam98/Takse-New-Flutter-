import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/src/features/home/controller/see_more_controller.dart';

import '../../../../core/components/common_network_image.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SeeMoreScreens extends GetView<SeeMoreServiceController> {
  const SeeMoreScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: controller.type),
      body: GetBuilder<SeeMoreServiceController>(
        builder: (controller) {
          return ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: controller.service?.nodes?.length ?? 0,
            itemBuilder: (context, index) {
              final service = controller.service?.nodes?[index];

              return Container(
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  // color: AppColors.blue,
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 90.h,
                        width: 90.w,
                        child: CommonNetworkImage(
                          image: service?.thumbnailImage ?? "",
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w), // Space between image and text
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service?.title ?? "Service Name",
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "120+Application done",
                            style: AppTextStyle.headline.small.regular,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: RichText(
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
                              ),
                              PrimaryButton(
                                height: 35.h,
                                width: 130,
                                borderRadius: 4,
                                text: "Order Now",
                                // backgroundColor: Colors.white,
                                textStyle: AppTextStyle.headline.large.black,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
