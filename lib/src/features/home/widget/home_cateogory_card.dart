import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takse/core/components/app_divider.dart';
import 'package:takse/core/components/header_element.dart';

import '../../../../core/constant/asset_const.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const HeaderElement(
            header: "Category",
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: 8.h),
          const AppDivider(endIndent: 90, indent: 90),
          SizedBox(height: 22.h),
          Row(
            children: List.generate(
              4,
              (index) => Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(image: AssetImage(AssetConst.lock5))),
                    ),
                    const SizedBox(height: 5),
                    Text("Category Name", textAlign: TextAlign.center, style: AppTextStyle.title.medium.semiBold),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
