import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/components/primary_dropdown.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/registration_controller.dart';
import 'package:takse/src/features/auth/model/city_data.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/state_response.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      appBar: const CommonAppBar(title: "", elevation: 0),
      body: SafeArea(
        child: ListView(
          children: [
            Image.asset(AssetConst.registerBG),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Image.asset(AssetConst.chutkiWithText, width: 270),
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      hintText: "Enter Name",
                      prefix: Image.asset(AssetConst.profileUser, cacheWidth: 28),
                      validator: (val) => controller.validateName(val),
                      controller: controller.nameController,
                    ),
                    const SizedBox(height: 15),
                    AppTextField(
                      hintText: "Enter E-mail ID",
                      prefix: Image.asset(AssetConst.closedMail, cacheWidth: 28),
                      validator: (val) => controller.validateEmail(val),
                      controller: controller.emailController,
                    ),
                    const SizedBox(height: 15),
                    AppTextField(
                      hintText: "Referral Code (Optional) ",
                      prefix: Image.asset(AssetConst.refer, cacheWidth: 28),
                      controller: controller.referralController,
                    ),
                    const SizedBox(height: 15),
                    AppTextField(
                      hintText: "Create PIN",
                      prefix: Image.asset(AssetConst.lock5, cacheWidth: 28),
                      validator: (val) => controller.validateMPin(val),
                      controller: controller.mPInController,
                    ),
                    const SizedBox(height: 15),
                    AppTextField(
                      hintText: "Area Pin Code",
                      prefix: Image.asset(AssetConst.location, cacheWidth: 28),
                      validator: (val) => controller.validateAreaPin(val),
                      controller: controller.areaPinController,
                    ),
                    // const SizedBox(height: 15),
                    // AppTextField(
                    //   hintText: "Pin code",
                    //   prefix: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Icon(Icons.hdr_auto_select_sharp, color: AppColors.grey, size: 20),
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    GetBuilder<RegistrationController>(
                      builder: (controller) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CommonDropdown<StateData>(
                                    hint: "Select State",
                                    selected: controller.selectedState,
                                    prefix: Image.asset(AssetConst.district, cacheWidth: 30),
                                    validator: (value) => controller.validateState(value),
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
                                  child: CommonDropdown<DistrictData>(
                                    hint: "Select District",
                                    selected: controller.selectedDistrict,
                                    prefix: Image.asset(AssetConst.district1, cacheWidth: 30),
                                    validator: (value) => controller.validateDistrict(value),
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
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonDropdown<CityData>(
                                    hint: "Select Block",
                                    selected: controller.selectedCity,
                                    prefix: Image.asset(AssetConst.house, cacheWidth: 25),
                                    validator: (value) => controller.validateBlock(value),
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
                                    enableSearch: false,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: CommonDropdown<LocationBlock>(
                                    hint: "Village/ City ",
                                    selected: controller.selectedBloc,
                                    prefix: Image.asset(AssetConst.village, cacheWidth: 30),
                                    validator: (value) => controller.validateVillage(value),
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
                                  value: controller.isAgreed.value,
                                  activeColor: AppColors.deepYellow,
                                  onChanged: (value) {
                                    controller.checkTermsAndConditions();
                                  },
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: AppTextStyle.title.medium.regular.black,
                                      text: "Please read and Accept our",
                                      children: [
                                        TextSpan(
                                            text: " Privacy Policy",
                                            style: AppTextStyle.title.medium.regular.lightBlue),
                                        const TextSpan(text: " &"),
                                        TextSpan(text: " T&C", style: AppTextStyle.title.medium.regular.lightBlue),
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
                              enable: controller.isAgreed.value,
                              onPressed: () {
                                if (controller.formKey.currentState!.validate()) {
                                  print("Validate");
                                }
                              },
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
