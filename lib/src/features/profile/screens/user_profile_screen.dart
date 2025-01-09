import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takse/core/components/app_textfield.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';
import 'package:takse/src/features/profile/controller/user_profile_controller.dart';

class UserProfileScreen extends GetView<UserProfileController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _profileImageSection(),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    prefix: Image.asset(AssetConst.refer2, cacheWidth: 26),
                    hintText: "Cyber Online Center",
                    suffix: Image.asset(AssetConst.editPen, cacheWidth: 26),
                  ),
                ),
                SizedBox(width: 3.h),
                Image.asset(AssetConst.tick)
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    prefix: Image.asset(AssetConst.profileUser, cacheWidth: 26),
                    hintText: "Golu Singh",
                    suffix: Image.asset(AssetConst.editPen, cacheWidth: 26),
                  ),
                ),
                SizedBox(width: 3.h),
                Image.asset(AssetConst.tick)
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 38),
            child: Column(
              children: [
                AppTextField(
                  prefix: Image.asset(AssetConst.closedMail, color: Colors.black, cacheWidth: 26),
                  hintText: "sgolu57@gmail.com",
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  prefix: Image.asset(AssetConst.dial, color: Colors.black, cacheWidth: 26),
                  hintText: "+91 8800719093",
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  prefix: Image.asset(AssetConst.closedMail, color: Colors.black, cacheWidth: 26),
                  hintText: "User Type",
                ),
                SizedBox(height: 31.h),
                PrimaryButton(
                  text: "UPDATE",
                  borderRadius: 30,
                  onPressed: () {},
                ),
                SizedBox(height: 40.h),
                Text(
                  "Your Account is Fully Activated for Life Time",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.headline.medium.green.regular,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _profileImageSection() {
    return Stack(
      children: [
        Container(
          height: 200.h,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            color: AppColors.deepYellow,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 140.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 4),
                    shape: BoxShape.circle,
                  ),
                  child: Obx(
                    () {
                      if (controller.profileImage.value == null) {
                        return Image.asset(AssetConst.wallet);
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          controller.profileImage.value!,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () {
                      controller.pickerProfileImage(ImageSource.camera);
                    },
                    child: Image.asset(AssetConst.camera, width: 35),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, size: 30),
        ),
      ],
    );
  }
}
