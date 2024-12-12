import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/src/features/auth/controller/forget_password_controller.dart';

import '../../../../core/components/app_textfield.dart';
import '../../../../core/components/primary_button.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppBar(title: "", elevation: 0),
      primary: true,
      body: Column(
        children: [
          Image.asset(AssetConst.forgetPasswordBG, height: 380),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(AssetConst.chutkiWithText, width: 330),
                      const SizedBox(height: 30),
                      AppTextField(
                        prefix: Image.asset(AssetConst.dial, cacheWidth: 26),
                        hintText: "OTP",
                        controller: controller.otpController,
                        validator: (val) => controller.validateField(message: "Please enter OTP", val: val),
                      ),
                      const SizedBox(height: 15),
                      Obx(
                        () {
                          return AppTextField(
                            prefix: Image.asset(AssetConst.dial, cacheWidth: 26),
                            hintText: "Enter New PIN",
                            controller: controller.mPinController,
                            obscureText: controller.hasPasswordVisibility1.value,
                            validator: (val) => controller.validateField(message: "Please enter PIN", val: val),
                            suffix: GestureDetector(
                              onTap: () {
                                controller.changePasswordVisibility1();
                              },
                              child: _getVisibilityIcon(false),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Obx(
                        () {
                          return AppTextField(
                            prefix: Image.asset(AssetConst.dial, cacheWidth: 26),
                            hintText: "Confirm PIN",
                            obscureText: controller.hasPasswordVisibility2.value,
                            controller: controller.confirmPinController,
                            validator: (val) => controller.validateConfirmPin(val),
                            suffix: GestureDetector(
                              onTap: () {
                                controller.changePasswordVisibility2();
                              },
                              child: _getVisibilityIcon(false),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      PrimaryButton(
                        text: "OPEN MY MALL",
                        onPressed: () {
                          if (controller.isValidate) {
                            console("Validate");
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getVisibilityIcon(bool isVisible) => isVisible
      ? Icon(Icons.visibility_outlined, color: AppColors.black, size: 22)
      : Image.asset(AssetConst.hide, cacheWidth: 20);
}
