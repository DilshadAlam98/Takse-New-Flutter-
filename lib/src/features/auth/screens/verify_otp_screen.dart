import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/otp_controller.dart';

import '../../../../core/theme/app_colors.dart';

class VerifyOtpScreen extends GetView<OtpController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              Image.asset(AssetConst.otp),
              SizedBox(height: 20.h),
              Text(
                "Enter Verification Code",
                textAlign: TextAlign.center,
                style: AppTextStyle.headline.large,
              ),
              SizedBox(height: 20.h),
              Text.rich(
                TextSpan(
                  text: 'We Are Automatically Detecting a SMS sent to\n',
                  style: AppTextStyle.title.large.regular,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.number} - ',
                      style: AppTextStyle.title.large.regular.bold,
                    ),
                    TextSpan(
                      text: 'Wrong Number ?',
                      style: AppTextStyle.title.large.yellow1.copyWith(height: 2),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Form(
                  key: controller.formKey,
                  child: Pinput(
                    focusNode: FocusNode(),
                    onCompleted: (value) => controller.verifyOTP(),
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
                      height: 60,
                      textStyle: AppTextStyle.headline.medium,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.deepYellow,
                          width: 2,
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Resend Code in :",
                    style: AppTextStyle.title.large.lightWeight,
                  ),
                  Obx(
                    () {
                      return Text(
                        "${controller.seconds.value} Second",
                        style: AppTextStyle.title.large.regular.blue,
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180.w,
                    child: OutlinedButton(
                      onPressed: () {
                        controller.resendOTP();
                      },
                      child: Text(
                        "Resend New OTP",
                        style: AppTextStyle.title.large.regular.green.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              PrimaryButton(
                text: "VERIFY",
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.verifyOTP();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
