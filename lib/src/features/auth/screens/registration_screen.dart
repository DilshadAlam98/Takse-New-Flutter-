import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/components/primary_dropdown.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/auth/controller/registration_controller.dart';
import 'package:takse/src/features/auth/model/user_type_entity.dart';

class WhoYouAre extends StatelessWidget {
  const WhoYouAre({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                "It seems like you are new to us !!!",
                style: AppTextStyle.display.medium,
                // textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text("Please  let know about you", style: AppTextStyle.title.large),
              const SizedBox(height: 20),
              Text("Who you are?", style: AppTextStyle.display.large),
              const SizedBox(height: 5),
              ...UserTypeEntity.getUserTypes().map(
                (e) {
                  return GetBuilder<RegistrationController>(
                    id: 'registration-first',
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectUser(e);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: controller.userType?.index == e.index
                                ? AppColors.deepYellow.withOpacity(0.6)
                                : AppColors.deepYellow.withOpacity(0.2),
                            border: Border.all(color: AppColors.deepYellow),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(e.label, style: AppTextStyle.title.large.semiBold),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: "Continue",
                onPressed: () {
                  Get.toNamed(RouteConst.registration);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Expanded(
                  child: PrimaryDropdown<String>(
                    hint: "State",
                    items: ["Food", "Medical", "Other"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.title.medium.black),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryDropdown<String>(
                    hint: "Select District",
                    items: ["Food", "Medical", "Other"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.title.medium.black),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropdown<String>(
                    hint: "Select Block",
                    items: ["Food", "Medical", "Other"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.title.medium.black),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryDropdown<String>(
                    hint: "Select Village",
                    items: ["Food", "Medical", "Other"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.title.medium.black),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
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
