import 'package:get/get.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

import '../models/get_all_type_service_res.dart';

class SeeMoreServiceController extends GetxController {
  ServicesNode? service;
  String type = "";

  @override
  void onInit() {
    final serviceType = Get.arguments as String;
    type = serviceType.capitalize ?? "";
    getService();
    super.onInit();
  }

  void getService() async {
    sendRequest(
      onTry: () async {
        final res = await ApiSource().getServicesByType(serviceType: type);
        service = res.data?.services;
        update();
        AppDialog.hideLoader();
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }
}
