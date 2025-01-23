import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:takse/core/components/app_divider.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/forget_password_controller.dart';

import '../../../../core/components/app_textfield.dart';
import '../../../../core/components/primary_button.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: AppColors.deepYellow,
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppBar(title: "", elevation: 0),
      primary: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(AssetConst.forgetPasswordBG, height: 240),
          Container(
            height: MediaQuery.sizeOf(context).height,
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
                      hintText: "Enter Mobile Number",
                      controller: controller.mobile,
                      validator: (val) => controller.validateField(message: "Please enter mobile number", val: val),
                    ),
                    Obx(
                      () {
                        if (!controller.hasSentOtp.value) return const SizedBox();
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            const AppDivider(),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Enter OTP", style: AppTextStyle.title.large),
                            ),
                            const SizedBox(height: 5),
                            Pinput(
                              focusNode: FocusNode(),
                              // onCompleted: (value) => controller.sendResetOtp(),
                              validator: (value) => controller.validateOTP(value),
                              keyboardAppearance: Brightness.light,
                              autofocus: true,
                              controller: controller.otpController,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              length: 6,
                              closeKeyboardWhenCompleted: true,
                              isCursorAnimationEnabled: true,
                              keyboardType: TextInputType.number,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                width: 78,
                                height: 55,
                                textStyle: AppTextStyle.headline.medium,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.deepYellow, width: 2),
                                ),
                              ),
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
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () {
                        return PrimaryButton(
                          text: controller.hasSentOtp.value ? "Reset" : "Send OTP",
                          onPressed: () {
                            if (controller.isValidate) {
                              if (controller.hasSentOtp.value) {
                                controller.resetMPIN();
                              } else {
                                controller.sendResetOtp();
                              }
                            }
                          },
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        controller.sendResetOtp();
                      },
                      child: Text(
                        "Resend OTP",
                        style: AppTextStyle.title.medium.grey,
                      ),
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

  Widget _getVisibilityIcon(bool isVisible) => isVisible
      ? Icon(Icons.visibility_outlined, color: AppColors.black, size: 22)
      : Image.asset(AssetConst.hide, cacheWidth: 20);
}
