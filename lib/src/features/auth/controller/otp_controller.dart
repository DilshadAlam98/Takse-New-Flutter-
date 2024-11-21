import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:takse/core/routes/route_const.dart';

import '../../../../core/constant/global_const.dart';
import '../../../source/api_source.dart';
import '../../../utils/app_dialog.dart';
import '../model/verify_otp_response.dart';

class OtpController extends GetxController {
  RxInt start = 30.obs;
  RxBool showSec = false.obs;
  VerifyOtpResponse? otpRes;
  final _source = ApiSource();
  String number = "";
  RxBool enableBtn = false.obs;

  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    number = Get.arguments['number'];
    startTimer();
    otpControllerListener();
    super.onInit();
  }

  void otpControllerListener() {
    otpController.addListener(
      () {
        if (otpController.text.trim().length == 6) {
          enableBtn.value = true;
        }
      },
    );
  }

  String? validateOTP(String? otp) {
    if (otp == null || otp.isEmpty) {
      return "Please enter 6 digit One Time Password";
    } else if (otp.length < 6) {
      return "One Time Password must be of 6 digits";
    } else {
      return null;
    }
  }

  void startTimer() {
    start.value = 30;
    showSec.value = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        timer.cancel();
        showSec.value = false;
        update(['otp']);
      } else {
        start.value--;
        showSec.value = true;
        update(['otp']);
      }
    });
  }

  void verifyOTP() {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final data = await _source.verifyOTP(otpController.text.trim(), number);
        otpRes = data;
        AppDialog.hideLoader();
        Get.toNamed(RouteConst.whoYouAre);
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  void resendOTP() {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final data = await _source.sentOpt(number);
        startTimer();
        AppDialog.showSuccessSnackBar(message: "OTP send successfully!!");
        AppDialog.hideLoader();
      },
      onError: (e) {
        AppDialog.hideLoader();
      },
    );
  }
}
