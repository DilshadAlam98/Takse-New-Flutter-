import 'package:dio/dio.dart';
import 'package:takse/core/config/api_config/rest_client.dart';
import 'package:takse/core/constant/api_const.dart';
import 'package:takse/src/features/auth/model/login_one_step.dart';
import 'package:takse/src/features/auth/model/verify_otp_response.dart';

class ApiSource {
  final _client = RestClient.getInstance();

  Future<LoginOneStep> sentOpt(String num) async {
    try {
      final res = await _client.dio.post(
        ApiConst.checkNumber,
        data: FormData.fromMap({"mobile_number": num}),
      );
      return LoginOneStep.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifyOtpResponse> verifyOTP(String otp, String number) async {
    try {
      final res = await _client.dio.post(
        ApiConst.verifyOTP,
        data: FormData.fromMap({"mobile_number": otp, "otp": otp}),
      );
      return VerifyOtpResponse.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
