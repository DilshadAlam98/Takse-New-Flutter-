import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/src/features/auth/model/forget_password_req.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

class ForgetPasswordController extends GetxController {
  final otpController = TextEditingController();
  final mobile = TextEditingController();
  final mPinController = TextEditingController();
  final confirmPinController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool hasPasswordVisibility1 = false.obs;
  RxBool hasPasswordVisibility2 = false.obs;
  RxBool hasSentOtp = false.obs;

  void changePasswordVisibility1() {
    hasPasswordVisibility1.toggle();
  }

  void changePasswordVisibility2() {
    hasPasswordVisibility2.toggle();
  }

  String? validateField({required String message, String? val}) {
    if (val.isNullOrEmpty) {
      return message;
    }
    return null;
  }

  String? validateConfirmPin(String? val) {
    if (val.isNullOrEmpty) {
      return "Please enter confirm PIN";
    } else if (mPinController.text.trim() != val) {
      return "Pin Does not match";
    }
    return null;
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

  void sendResetOtp() {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final data = await ApiSource().sendResetPasswordOtp(num: mobile.text.trim());
        hasSentOtp.value = data['status'];
        if (data['status'] == false) {
          AppDialog.showErrorSnackBar(message: data['status']);
        } else {
          AppDialog.showSuccessSnackBar(message: "OTP send successfully");
        }
        AppDialog.hideLoader();
      },
      onError: (e) {
        AppDialog.showErrorSnackBar(message: e.message);
        AppDialog.hideLoader();
      },
    );
  }

  void resetMPIN() {
    sendRequest(
      onTry: () async {
        final param = ForgetPasswordReq(
          mobileNumber: mobile.text.trim(),
          newMpin: mPinController.text.trim(),
          otp: otpController.text.trim(),
        );
        final Map<String, dynamic> data = await ApiSource().resetPassword(param);
        if (data['status'] == false) {
          AppDialog.showErrorSnackBar(message: data['message']);
        } else {
          AppDialog.showSuccessSnackBar(message: "MPIN reset successfully");
        }
      },
      onError: (e) {
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  bool get isValidate => formKey.currentState!.validate();
}
