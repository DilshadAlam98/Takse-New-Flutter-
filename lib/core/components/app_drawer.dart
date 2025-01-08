import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takse/core/components/app_divider.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/entity/drawer_entity.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Version 1.0.2", textAlign: TextAlign.center, style: AppTextStyle.title.large),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.purple),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(AssetConst.question, height: 30),
                              Image.asset(AssetConst.leader, height: 30),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: 115,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(AssetConst.wallet, height: 25),
                                  const SizedBox(width: 6),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Total Point", style: AppTextStyle.title.medium.white.regular),
                                      const SizedBox(height: 5),
                                      Text("1239", style: AppTextStyle.title.medium.white.bold),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dilshad Alam"),
                                Text("8890782870"),
                                Text("Takse Business Partner"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  children: [
                    // SizedBox(height: 10.h),
                    ...DrawerEntity.getSideMenuOptions().map(
                      (e) {
                        return ListTile(
                          title: Text(e.label, style: AppTextStyle.title.large),
                          leading: Image.asset(e.asset!, height: 28),
                        );
                      },
                    ),
                    const AppDivider(),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Image.asset(AssetConst.companyInfo, height: 28),
                          SizedBox(width: 20.h),
                          Text("Company Information", style: AppTextStyle.title.large),
                        ],
                      ),
                      children: DrawerEntity.getCompanyDrawerOptions().map(
                        (e) {
                          return ListTile(
                            title: Text(e.label, style: AppTextStyle.title.large),
                            leading: Image.asset(e.asset!, height: 28),
                          );
                        },
                      ).toList(),
                    ),
                    const AppDivider(),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Image.asset(AssetConst.companyInfo, height: 28),
                          SizedBox(width: 20.h),
                          Text("Settings", style: AppTextStyle.title.large),
                        ],
                      ),
                      children: DrawerEntity.getSettingsDrawerOptions().map(
                        (e) {
                          return ListTile(
                            title: Text(e.label, style: AppTextStyle.title.large),
                            leading: Image.asset(e.asset!, height: 28),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
