import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:takse/core/routes/route_const.dart';

import '../../../../core/constant/global_const.dart';
import '../../../source/api_source.dart';
import '../../../utils/app_dialog.dart';
import '../model/verify_otp_response.dart';

class OtpController extends GetxController {
  VerifyOtpResponse? otpRes;
  final _source = ApiSource();
  String number = "";
  RxBool enableBtn = false.obs;

  var seconds = 60.obs; // Reactive variable for the countdown timer
  Timer _timer = Timer(const Duration(), () {});

  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
    number = Get.arguments['number'];

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

  void startTimer() {
    if (_timer!.isActive) _timer!.cancel();
    seconds.value = 60; // Reset the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--; // Decrease the timer
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  @override
  void onClose() {
    _timer!.cancel(); // Clean up the timer when the controller is disposed
    super.onClose();
  }
}
