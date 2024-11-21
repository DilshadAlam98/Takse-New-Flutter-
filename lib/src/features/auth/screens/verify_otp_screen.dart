import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:takse/core/base/navigation.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/otp_controller.dart';

class VerifyOtpScreen extends GetView<OtpController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.arrow_back),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton.filledTonal(
                onPressed: () => goBack(),
                icon: const Icon(Icons.arrow_back_outlined, size: 40),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GetBuilder<OtpController>(
                  id: "otp",
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Verification", style: AppTextStyle.headline.large),
                        const SizedBox(height: 15),
                        Text(
                          "We have sent you the verification\ncode on +91 ${controller.number}",
                          textAlign: TextAlign.justify,
                          style: AppTextStyle.title.large.regular,
                        ),
                        const SizedBox(height: 25),
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
                              height: 68,
                              textStyle: AppTextStyle.headline.medium,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white300,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.deepYellow,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: controller.showSec.value
                                ? null
                                : () {
                                    controller.resendOTP();
                                  },
                            child: IntrinsicWidth(
                              child: Row(
                                children: [
                                  Text(
                                    "Resend OTP",
                                    style: AppTextStyle.body.large.copyWith(
                                      color: controller.showSec.value ? AppColors.grey : AppColors.black,
                                    ),
                                  ),
                                  if (controller.showSec.value) ...[
                                    // Text(" || ", style: AppTextStyle.title.large.grey),
                                    Text(
                                      " ${controller.start.value} Sec.",
                                      style: AppTextStyle.body.large.deepYellow.semiBold,
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Obx(
                          () => PrimaryButton(
                            text: "Continue",
                            enable: controller.enableBtn.value,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.verifyOTP();
                              }
                            },
                          ),
                        ),
                      ],
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
}
