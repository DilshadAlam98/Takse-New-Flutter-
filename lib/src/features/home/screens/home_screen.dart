import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/base/navigation.dart';
import 'package:takse/core/components/app_drawer.dart';
import 'package:takse/core/components/common_network_image.dart';
import 'package:takse/core/components/header_element.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/src/features/home/controller/home_controller.dart';
import 'package:takse/src/features/home/widget/home_cateogory_card.dart';
import 'package:takse/src/features/home/widget/service_card.dart';
import 'package:takse/src/utils/extensions.dart';

import '../../../../core/components/app_divider.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      appBar: _appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 12, top: 14.0, left: 12, bottom: 10),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    /// Carousel Sliders
                    if (controller.banners.isNotEmpty)
                      ExpandableCarousel(
                        options: ExpandableCarouselOptions(
                          floatingIndicator: true,
                          showIndicator: true,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                        ),
                        items: controller.banners.map((banner) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                alignment: Alignment.center,
                                height: 200.h,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CommonNetworkImage(image: banner.picture, fit: BoxFit.contain),
                              );
                            },
                          );
                        }).toList(),
                      ),

                    const SizedBox(height: 20),

                    HomeCategoryCard(allCategories: controller.allCategories?.rows ?? []),

                    const SizedBox(height: 30),
                    const AppDivider(indent: 80, endIndent: 80),

                    /// Govt Jobs Section
                    if (controller.govtService?.nodes?.isNotEmpty ?? false) ...[
                      HeaderElement(
                        header: "SARKARI JOB FORM",
                        // onSeeMore: () {
                        //   Get.toNamed(RouteConst.seeMoreService, arguments: "Sarkari Forms");
                        // },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 285,
                        child: ListView.builder(
                          itemCount: controller.govtService?.nodes?.length.clamp(0, 4) ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final service = controller.govtService?.nodes?[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ServiceCard(service: service),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],

                    /// Govt Jobs Section
                    if (controller.govtSchemes?.nodes?.isNotEmpty ?? false) ...[
                      HeaderElement(
                        header: "GOVERNMENT SCHEME",
                        // onSeeMore: () {
                        //   Get.toNamed(RouteConst.seeMoreService, arguments: "Govt. Schemes");
                        // },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 285,
                        child: ListView.builder(
                          itemCount: controller.govtSchemes?.nodes?.length.clamp(0, 4) ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final service = controller.govtSchemes?.nodes?[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ServiceCard(service: service),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],

                    /// Top Services Sections

                    if (controller.topService?.nodes?.isNotEmpty ?? false) ...[
                      const AppDivider(indent: 80, endIndent: 80),
                      HeaderElement(
                        header: "TOP SERVICES",
                        // onSeeMore: () {
                        //   Get.toNamed(RouteConst.seeMoreService, arguments: "Top");
                        // },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 285,
                        child: ListView.builder(
                          itemCount: controller.topService?.nodes?.length.clamp(0, 4).length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final topService = controller.topService?.nodes?[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ServiceCard(service: topService),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              context.openDrawer();
            },
            child: Image.asset(AssetConst.humburger, cacheWidth: 30),
          );
        },
      ),
      title: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetConst.playIcon),
                Image.asset(AssetConst.takseMall),
                GestureDetector(
                    onTap: () {
                      console("tap Search");
                    },
                    child: Image.asset(AssetConst.search, height: 35)),
              ],
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            console("Tap Notification");
          },
          child: Image.asset(AssetConst.notification, width: 40),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
