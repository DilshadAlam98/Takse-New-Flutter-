import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/theme/app_colors.dart';

import '../../core/constant/asset_const.dart';

class DocUploadWidget extends StatelessWidget {
  const DocUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "title"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.h),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 82.h,
              width: 184.h,
              margin: EdgeInsets.only(bottom: 6.h),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Uppload Image"),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.h),
                    child: Image.asset(
                      AssetConst.closedMail,
                      height: 56.h,
                      width: 56.w,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      AssetConst.closedMail,
                      height: 26.h,
                      width: 26.w,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
