import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommonUtils {
  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      try {
        await launchUrl(url);
      } catch (e) {
        debugPrint('Error launching URL: $e');
        throw 'Could not launch $url';
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<File?> pickOrCaptureImage({ImageSource source = ImageSource.gallery}) async {
    final permission = source == ImageSource.camera ? Permission.camera : Permission.photos;
    if (!await permission.isGranted) {
      await permission.request();
    }
    final picker = ImagePicker();
    final result = await picker.pickImage(source: source);
    if (result == null) return null;
    return File(result.path);
  }
}
