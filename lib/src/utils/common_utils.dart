import 'package:flutter/cupertino.dart';
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
}
