import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/auth_controller.dart';

import '../../../../core/components/primary_button.dart';

class EnterYourMobileScreen extends GetView<AuthController> {
  EnterYourMobileScreen({super.key});

  final _form = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _mpinController = TextEditingController();

  final controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(
        id: 'auth',
        builder: (controller) {
          return ListView(
            shrinkWrap: true,
            children: [
              if (controller.loginRes?.isRegistered == true) ...{
                Image.asset(
                  AssetConst.mPinAsset,
                  fit: BoxFit.cover,
                ),
              } else ...{
                Image.asset(
                  AssetConst.loginBG,
                  fit: BoxFit.cover,
                ),
              },
              Container(
                height: MediaQuery.sizeOf(context).height * 0.55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        Image.asset(AssetConst.chutkiWithText, width: 270),
                        const SizedBox(height: 40),
                        AppTextField(
                          prefix: Image.asset(AssetConst.dial, cacheWidth: 26),
                          hintText: "Enter Your Mobile Number",
                          controller: _mobileController,
                          validator: (val) => controller.validateNumber(val),
                        ),
                        if (controller.loginRes?.isRegistered == true) ...{
                          const SizedBox(height: 15),
                          AppTextField(
                            obscureText: controller.hasPassVisibility.value,
                            prefix: Image.asset(AssetConst.lock, cacheWidth: 26),
                            hintText: "Enter Your MPIN",
                            suffix: GestureDetector(
                              onTap: () {
                                controller.enableVisibility();
                              },
                              child: _getVisibilityIcon(controller.hasPassVisibility.value),
                            ),
                            controller: _mpinController,
                            validator: (val) => controller.validateMPIN(val),
                          ),
                        },
                        const SizedBox(height: 30),
                        if (controller.loginRes?.isRegistered == true) ...[
                          Column(
                            children: [
                              PrimaryButton(
                                text: "OPEN MY MALL",
                                onPressed: () {
                                  if (isValidate) {}
                                },
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      console("Tap Another User");
                                    },
                                    child: Text("Another User?", style: AppTextStyle.title.medium.regular),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteConst.forgetPassword);
                                    },
                                    child: Text("Forget MPIN?", style: AppTextStyle.title.medium.regular),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ] else ...[
                          PrimaryButton(
                            text: "SUBMIT",
                            onPressed: () {
                              if (isValidate) {
                                controller.sendOtp(_mobileController.text.trim());
                              }
                            },
                          ),
                        ],
                        if (controller.loginRes?.isRegistered != true) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _youtubeButtons(onTap: () {}, label: "टक से क्या है ?"),
                                _youtubeButtons(onTap: () {}, label: "Sign Up कैसे करे ?"),
                                _youtubeButtons(onTap: () {}, label: "फायदा क्या है ? "),
                              ],
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getVisibilityIcon(bool isVisible) => isVisible
      ? Icon(Icons.visibility_outlined, color: AppColors.black, size: 22)
      : Image.asset(AssetConst.hide, cacheWidth: 20);

  Widget _youtubeButtons({required VoidCallback onTap, required String label}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(AssetConst.youtube, width: 40),
          Text(label, style: AppTextStyle.title.medium.regular),
        ],
      ),
    );
  }

  bool get isValidate => _form.currentState!.validate();
}
