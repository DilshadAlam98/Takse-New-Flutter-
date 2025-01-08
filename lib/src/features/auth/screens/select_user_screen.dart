import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/common_appbar.dart';

import '../../../../core/constant/asset_const.dart';
import '../../../../core/entity/user_type_entity.dart';
import '../../../../core/routes/route_const.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SelectUserTypeScreen extends StatelessWidget {
  const SelectUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.deepYellow,
        appBar: const CommonAppBar(title: "", elevation: 0),
        body: ListView(
          shrinkWrap: true,
          children: [
            Image.asset(AssetConst.loginBG, height: 400.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Image.asset(AssetConst.chutkiWithText, width: 330.h),
                  SizedBox(height: 5.h),
                  Text(
                    'SELECT USER TYPE',
                    style: AppTextStyle.headline.large.deepYellow.regular,
                  ),
                  SizedBox(height: 15.h),
                  ...UserTypeEntity.getUserTypes().map(
                    (e) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteConst.registration, arguments: {"userType": e});
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            color: e.color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.h,
                                backgroundImage: AssetImage(e.asset!),
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 15.h),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.label, style: AppTextStyle.title.large.white),
                                    const SizedBox(height: 5),
                                    Text(
                                      e.desc,
                                      style: AppTextStyle.title.medium.regular.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Self Help", style: AppTextStyle.headline.small.black),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
