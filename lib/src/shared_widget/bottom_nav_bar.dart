import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/shared_widget/bottom_nav_controller.dart';

import '../../core/constant/asset_const.dart';
import '../../core/entity/bottom_bar_entity.dart';
import '../features/home/screens/home_screen.dart';

class CommonBottomAppBar extends GetView<BottomNavController> {
  const CommonBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () {
          return getPages()[controller.selectedIndex.value];
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 58,
        elevation: 12,
        notchMargin: 10,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        shape: const CircularNotchedRectangle(),
        color: AppColors.yellow1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...BottomBarEntity.getBottomBarEntityFirst().map(
              (e) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.changeBottomTab(e.index);
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (e.index != 2) ...[
                          const Icon(Icons.home, size: 28),
                        ],
                        Text(e.label, style: AppTextStyle.title.large.semiBold),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.yellow1, width: 2),
        ),
        onPressed: () {},
        backgroundColor: AppColors.white,
        child: Image.asset(AssetConst.wallet, height: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  List<Widget> getPages() {
    return [
      const HomeScreen(),
      const Center(child: Text("Help Screen")),
      const Center(child: Text("Wallet Screen")),
      const Center(child: Text("Training Screen")),
      const Center(child: Text("Profile Screen")),
    ];
  }
}
