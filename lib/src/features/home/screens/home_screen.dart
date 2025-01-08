import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:takse/core/base/navigation.dart';
import 'package:takse/core/components/app_drawer.dart';
import 'package:takse/core/components/header_element.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/src/features/home/widget/home_cateogory_card.dart';
import 'package:takse/src/features/home/widget/service_card.dart';
import 'package:takse/src/utils/extensions.dart';

import '../../../../core/components/app_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      appBar: _appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14.0),
          child: ListView(
            children: [
              /// Carousel Sliders
              ExpandableCarousel(
                options: ExpandableCarouselOptions(
                  autoPlayInterval: const Duration(seconds: 5),
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              const HomeCategoryCard(),
              const SizedBox(height: 30),
              const AppDivider(indent: 80, endIndent: 80),

              /// Govt Jobs Section
              const HeaderElement(header: "GOVERNMENT JOB FORM"),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 30,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ServiceCard(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              /// Top Services Sections
              const AppDivider(indent: 80, endIndent: 80),

              const HeaderElement(header: "TOP SERVICES"),
              const SizedBox(height: 10),

              SizedBox(
                height: 325,
                child: ListView.builder(
                  itemCount: 30,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ServiceCard(),
                    );
                  },
                ),
              )
            ],
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
              child: Image.asset(AssetConst.humburger, cacheWidth: 30));
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
            child: Image.asset(AssetConst.notification, width: 40)),
        const SizedBox(width: 15),
      ],
    );
  }
}
