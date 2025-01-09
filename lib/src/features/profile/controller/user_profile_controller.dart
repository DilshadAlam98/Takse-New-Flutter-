import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takse/src/utils/common_utils.dart';

class UserProfileController extends GetxController {
  final profileImage = Rx<File?>(null);

  void pickerProfileImage(ImageSource source) async {
    try {
      final image = await CommonUtils.pickOrCaptureImage(source: source);
      if (image == null) return;
      profileImage.value = image;
    } catch (e) {
      debugPrint("Error in picking or capturing image");
    }
  }
}
