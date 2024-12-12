import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:screwdriver/screwdriver.dart';

class ForgetPasswordController extends GetxController {
  final otpController = TextEditingController();
  final mPinController = TextEditingController();
  final confirmPinController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool hasPasswordVisibility1 = false.obs;
  RxBool hasPasswordVisibility2 = false.obs;

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

  bool get isValidate => formKey.currentState!.validate();
}
