import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/components/app_divider.dart';
import 'package:takse/core/components/header_element.dart';
import 'package:takse/core/local/local_const.dart';
import 'package:takse/src/features/home/models/get_all_categories.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({super.key, required this.allCategories});
  final List<Rows> allCategories;

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
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: allCategories
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              image: DecorationImage(
                                image: NetworkImage(LocalConst.localImgUrl + (e.picture ?? "")),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 30,
                            child: Text(
                              e.title?.capitalized ?? "",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.title.medium.semiBold.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
