import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/components/primary_dropdown.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/entity/user_type_entity.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/registration_controller.dart';
import 'package:takse/src/features/auth/model/city_data.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/state_response.dart';

class SelectUserTypeScreen extends StatelessWidget {
  const SelectUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(AssetConst.loginBG, height: 400),
          Container(
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
                          color: AppColors.deepYellow,
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
                                  Text(e.label, style: AppTextStyle.title.large),
                                  Text(
                                    e.desc,
                                    style: AppTextStyle.title.medium.regular,
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
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: "Continue",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    var th = const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(th);
    return Scaffold(
      appBar: const CommonAppBar(centerTile: true, title: "Sign Up"),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            AppTextField(
              hintText: "Full Name",
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person, color: AppColors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            AppTextField(
              hintText: "Mobile Number",
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.call, color: AppColors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            AppTextField(
              hintText: "Email",
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.email, color: AppColors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            AppTextField(
              hintText: "MPIN",
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.lock, color: AppColors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            AppTextField(
              hintText: "Referral Code (Optional)",
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.location_on, color: AppColors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            AppTextField(
              hintText: "Pin code",
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.hdr_auto_select_sharp, color: AppColors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            GetBuilder<RegistrationController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    child: PrimaryDropdown<StateData>(
                      hint: "State",
                      selected: controller.selectedState,
                      items: controller.states
                              ?.map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name, style: AppTextStyle.title.medium.black),
                                ),
                              )
                              .toList() ??
                          [],
                      onChanged: (value) {
                        controller.onStateChange(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryDropdown<DistrictData>(
                      hint: "Select District",
                      selected: controller.selectedDistrict,
                      items: controller.districts
                              ?.map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name, style: AppTextStyle.title.medium.black),
                                ),
                              )
                              .toList() ??
                          [],
                      onChanged: (value) {
                        controller.onDistrictChange(value!);
                      },
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropdown<CityData>(
                    hint: "Select Block",
                    selected: controller.selectedCity,
                    items: controller.cities
                            ?.map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name, style: AppTextStyle.title.medium.black),
                              ),
                            )
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.onCityChange(value!);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryDropdown<LocationBlock>(
                    hint: "Select Village",
                    selected: controller.selectedBloc,
                    items: controller.blocks
                            ?.map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name, style: AppTextStyle.title.medium.black),
                              ),
                            )
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.onBlockChange(value!);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  value: true,
                  activeColor: AppColors.deepYellow,
                  onChanged: (value) {},
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.title.medium.regular.black,
                      text: "Please read and Accept our",
                      children: [
                        TextSpan(text: " Privacy Policy", style: AppTextStyle.title.medium.regular.lightBlue),
                        const TextSpan(text: " &"),
                        TextSpan(text: " Terms and Conditions", style: AppTextStyle.title.medium.regular.lightBlue),
                        const TextSpan(text: " before signup."),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              text: "Sign Up",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
