import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:takse/core/components/app_divider.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/entity/drawer_entity.dart';
import 'package:takse/core/local/app_session.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/utils/app_dialog.dart';

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
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConst.userProfileScreen);
                },
                child: Container(
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
              ),
              Flexible(
                child: ListView(
                  children: [
                    // SizedBox(height: 10.h),
                    ...DrawerEntity.getSideMenuOptions().map(
                      (e) {
                        return ListTile(
                          onTap: () {
                            _routeToScreen(e);
                          },
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
                            onTap: () => _settingsOptionsClick(e),
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

  void _routeToScreen(DrawerEntity e) {
    if (e.index == 1) {
      Get.toNamed(RouteConst.userProfileScreen);
    } else if (e.index == 2) {
      Get.toNamed(RouteConst.manageOrder);
    }
  }

  void _settingsOptionsClick(DrawerEntity e) {
    if (e.index == 5) {
      AppDialog.showConfirmation(
        asset: AssetConst.logout,
        btnColor: AppColors.red,
        btnTextStyle: AppTextStyle.title.large.white,
        secondaryBtn: PrimaryButton(
          borderColor: Colors.transparent,
          backgroundColor: AppColors.grey,
          text: "Cancel",
          onPressed: () => Get.back(),
        ),
        message: "Once you logout from the app, you will loss the saved credentials",
        header: "Are you sure you want to logout?",
        onConfirm: () async {
          await AppSession().clearPreference();
          AppDialog.showSuccessSnackBar(message: "Logout successfully");
          Get.offAndToNamed(RouteConst.verifyNo);
        },
        confirmText: "Logout",
      );
    }
  }
}
