import 'package:flutter/material.dart';
import 'package:takse/core/components/common_appbar.dart';

import '../../../../core/constant/asset_const.dart';
import '../../../../core/entity/user_type_entity.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SelectUserTypeScreen extends StatelessWidget {
  const SelectUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      appBar: const CommonAppBar(title: "", elevation: 0),
      body: Column(
        children: [
          Image.asset(AssetConst.loginBG, height: 450),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(AssetConst.chutkiWithText, width: 330),
                    const SizedBox(height: 5),
                    Text(
                      'SELECT USER TYPE',
                      style: AppTextStyle.headline.large.deepYellow.regular,
                    ),
                    const SizedBox(height: 15),
                    ...UserTypeEntity.getUserTypes().map(
                      (e) {
                        return Container(
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
                              const CircleAvatar(radius: 30),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.label, style: AppTextStyle.title.large.white),
                                    Text(
                                      e.desc,
                                      style: AppTextStyle.title.medium.regular.white,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("Self Help", style: AppTextStyle.headline.small.black),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
