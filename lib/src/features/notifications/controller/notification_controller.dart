import 'package:get/get.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/src/features/notifications/models/notifications_res.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

class NotificationController extends GetxController {
  MyNotificationRes? notification;
  final _apiSource = ApiSource();

  void getMyNotification() async {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final data = await _apiSource.getMyNotification();
        notification = data;
        AppDialog.hideLoader();
      },
      onError: (e) {
        AppDialog.hideLoader();
      },
    );
  }
}
