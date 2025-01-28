import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/local/app_session.dart';
import 'package:takse/core/local/local_const.dart';
import 'package:takse/src/features/home/models/get_my_account_res.dart';
import 'package:takse/src/features/profile/model/update_profile_req.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';
import 'package:takse/src/utils/common_utils.dart';

class UserProfileController extends GetxController {
  final profileImage = Rx<File?>(null);
  GetMyAccountRes? profileDetails;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final userTypeController = TextEditingController();

  final _source = ApiSource();

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  void pickerProfileImage(ImageSource source) async {
    try {
      final image = await CommonUtils.pickOrCaptureImage(source: source);
      if (image == null) return;
      profileImage.value = image;
    } catch (e) {
      debugPrint("Error in picking or capturing image");
    }
  }

  void getUserProfile() async {
    final profile = await AppSession().getString(LocalConst.profileDetails);
    if (profile == null) return;
    profileDetails = GetMyAccountRes.fromJson(jsonDecode(profile));
    nameController.text = profileDetails?.user?.name ?? "";
    emailController.text = profileDetails?.user?.email ?? "";
    mobileController.text = "+91 ${profileDetails?.user?.mobileNumber ?? ""}";
    userTypeController.text = profileDetails?.user?.role?.name ?? "";
    update(['profile']);
  }

  void updateProfile() async {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final req = UpdateProfileRequestData(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          picture: profileImage.value,
        );
        final message = await _source.updateProfile(req);
        AppDialog.showSuccessSnackBar(message: message);
        final accountRes = await _source.getMyAccountDetails();
        await AppSession().setString(key: LocalConst.profileDetails, value: jsonEncode(accountRes.toJson()));
        getUserProfile();
        AppDialog.hideLoader();
      },
      onError: (e) {
        AppDialog.showErrorSnackBar(message: e.message ?? "Error to update profile");
        AppDialog.hideLoader();
      },
    );
  }
}
