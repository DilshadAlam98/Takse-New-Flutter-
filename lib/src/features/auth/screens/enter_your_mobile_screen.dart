import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/auth_controller.dart';

class EnterYourMobileScreen extends GetView<AuthController> {
  EnterYourMobileScreen({super.key});

  final _form = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _mpinController = TextEditingController();

  final controller = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).width * 0.9,
                width: double.infinity,
                color: AppColors.deepYellow,
              ),
              Positioned(
                top: 80,
                left: 100,
                right: 100,
                child: Image.asset(
                  AssetConst.loginLogo,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 60,
                left: 70,
                child: Text("टक से है तो", style: AppTextStyle.display.large.semiBold),
              ),
              Positioned(
                bottom: 30,
                right: 70,
                child: Text("टक से होगा", style: AppTextStyle.display.large.semiBold.red),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Text("स्मार्ट मोबाइल ग्राहक सेवा केंद्र", style: AppTextStyle.display.medium),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.deepYellow),
                    ),
                    child: GetBuilder<AuthController>(
                      id: "auth",
                      init: AuthController(),
                      builder: (controller) {
                        return Column(
                          children: [
                            AppTextField(
                              textInputType: TextInputType.number,
                              maxLength: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.call, color: AppColors.grey, size: 25),
                              ),
                              hintText: "Enter your mobile number",
                              controller: _mobileController,
                              validator: (val) => controller.validateNumber(val),
                            ),
                            if (controller.loginRes?.isRegistered == true) ...[
                              const SizedBox(height: 15),
                              AppTextField(
                                textInputType: TextInputType.number,
                                maxLength: 4,
                                obscureText: !controller.hasPassVisibility.value,
                                prefix: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.lock, color: AppColors.grey, size: 25)),
                                suffix: IconButton(
                                  onPressed: () => controller.enableVisibility(),
                                  icon: Icon(
                                    controller.hasPassVisibility.value ? Icons.visibility_off : Icons.visibility,
                                    size: 25,
                                    color: AppColors.grey,
                                  ),
                                ),
                                hintText: "Enter your MPIN",
                                controller: _mpinController,
                                validator: (val) => controller.validateMPIN(val),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: "Submit",
                    onPressed: () {
                      if (isValidate) {
                        controller.sendOtp(_mobileController.text.trim());
                      }
                    },
                  ),
                  const SizedBox(height: 60),
                  Image.asset(AssetConst.youturbe, width: 60),
                  TextButton(
                    onPressed: () {
                      /// TODO:: Launch URL to youtube channel
                    },
                    child: const Text("Demo Video"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool get isValidate => _form.currentState!.validate();
}
