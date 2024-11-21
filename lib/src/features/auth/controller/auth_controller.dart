import 'package:get/get.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/src/features/auth/model/login_one_step.dart';
import 'package:takse/src/features/auth/model/verify_otp_response.dart';
import 'package:takse/src/utils/app_dialog.dart';

import '../../../../core/constant/global_const.dart';
import '../../../source/api_source.dart';

class AuthController extends GetxController {
  final _source = ApiSource();

  RxBool hasPassVisibility = false.obs;
  LoginOneStep? loginRes;
  VerifyOtpResponse? otpRes;

  String? validateNumber(String? num) {
    if (num == null || num.isEmpty) {
      return "Please enter mobile number";
    } else if (num.length < 10) {
      return "Mobile number must be of 10 digits";
    }
    return null;
  }

  String? validateMPIN(String? pin) {
    if (pin == null || pin.isEmpty) {
      return "Please enter MPIN";
    } else if (pin.length < 4) {
      return "MPIN must be of 4 digits";
    }
    return null;
  }

  void enableVisibility() {
    hasPassVisibility.toggle();
    update(['auth']);
  }

  void sendOtp(String num) {
    AppDialog.showLoader();
    sendRequest(
      onTry: () async {
        final data = await _source.sentOpt(num);
        AppDialog.showSuccessSnackBar(message: "OTP send the mobile number");
        loginRes = data;
        update(['auth']);
        AppDialog.hideLoader();
        if (data.isRegistered == false) {
          Get.toNamed(RouteConst.otpNo, arguments: {'number': num});
        }
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }
}
