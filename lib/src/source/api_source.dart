import 'package:dio/dio.dart';
import 'package:takse/core/config/api_config/rest_client.dart';
import 'package:takse/core/constant/api_const.dart';
import 'package:takse/src/features/auth/model/city_data.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/forget_password_req.dart';
import 'package:takse/src/features/auth/model/getpincode_res.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/login_one_step.dart';
import 'package:takse/src/features/auth/model/login_with_password_req.dart';
import 'package:takse/src/features/auth/model/login_with_password_res.dart';
import 'package:takse/src/features/auth/model/register_req.dart';
import 'package:takse/src/features/auth/model/verify_otp_response.dart';
import 'package:takse/src/features/home/models/get_my_account_res.dart';
import 'package:takse/src/features/notifications/models/get_banners_res.dart';
import 'package:takse/src/features/notifications/models/get_home_response.dart';
import 'package:takse/src/features/notifications/models/get_social_media_link_res.dart';
import 'package:takse/src/features/notifications/models/notifications_res.dart';
import 'package:takse/src/features/profile/model/update_profile_req.dart';

import '../features/auth/model/state_response.dart';

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

  Future<LoginWithPasswordResponse> loginWithPassword(LoginWithPasswordRequest param) async {
    try {
      final res = await _client.dio.post(
        ApiConst.verifyMPIM,
        data: FormData.fromMap(param.toJson()),
      );
      return LoginWithPasswordResponse.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifyOtpResponse> verifyOTP(String otp, String number) async {
    try {
      final res = await _client.dio.post(
        ApiConst.verifyOTP,
        data: FormData.fromMap({"mobile_number": number, "otp": otp}),
      );
      return VerifyOtpResponse.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<StateData>> getStates() async {
    try {
      List<StateData> states = [];
      final res = await _client.dio.get(ApiConst.states);
      for (var v in res.data) {
        states.add(StateData.fromJson(v));
      }
      return states;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DistrictData>> getDistrict(int id) async {
    try {
      List<DistrictData> district = [];
      final res = await _client.dio.get("${ApiConst.districts}/$id");
      for (var v in res.data) {
        district.add(DistrictData.fromJson(v));
      }
      return district;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CityData>> getCities(int id) async {
    try {
      List<CityData> cities = [];
      final res = await _client.dio.get("${ApiConst.cities}/$id");
      for (var v in res.data) {
        cities.add(CityData.fromJson(v));
      }
      return cities;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LocationBlock>> getBlocks(int id) async {
    try {
      List<LocationBlock> blocks = [];
      final res = await _client.dio.get("${ApiConst.blocks}/$id");
      for (var v in res.data) {
        blocks.add(LocationBlock.fromJson(v));
      }
      return blocks;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> registerUser(RegisterRequest param) async {
    try {
      final formData = FormData.fromMap({
        "name": param.name,
        "email": param.email,
        "role_id": param.roleId,
        "mobile_number": param.mobileNo,
        "block_id": param.blockId,
        "state_id": param.stateId,
        "district_id": param.districtId,
        "password": param.password,
        "pincode": param.pincCode,
        "referral_code": param.referralCode,
      });
      final res = await _client.dio.post(ApiConst.register, data: formData);
      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GetPinCode>> getPinCode(String pinCode) async {
    try {
      final res = await _client.dio.get("${ApiConst.getPinCode}/$pinCode");
      List<GetPinCode> pinCodeList = [];
      for (var v in res.data) {
        pinCodeList.add(GetPinCode.fromJson(v));
      }
      return pinCodeList;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetMyAccountRes> getMyAccountDetails() async {
    try {
      final res = await _client.dio.get(ApiConst.myAccount);
      return GetMyAccountRes.fromJson(res.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<MyNotificationRes> getMyNotification() async {
    try {
      final res = await _client.dio.get(ApiConst.notification);
      return MyNotificationRes.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetSocialMediaRes> getSocialMediaLinks() async {
    try {
      final res = await _client.dio.get(ApiConst.socialMediaLinks);
      return GetSocialMediaRes.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GetBannersRes>> getBanners() async {
    try {
      List<GetBannersRes> banners = [];
      final res = await _client.dio.get(ApiConst.socialMediaLinks);
      for (var v in res.data) {
        banners.add(GetBannersRes.fromJson(v));
      }
      return banners;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetHomeRes> getHomeRes() async {
    try {
      final res = await _client.dio.get(ApiConst.home);
      return GetHomeRes.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateProfile(UpdateProfileRequestData req) async {
    try {
      final res = await _client.dio.post(
        ApiConst.manageProfile,
        data: FormData.fromMap(await req.toJson()),
      );
      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resetPassword(ForgetPasswordReq param) async {
    try {
      final res = await _client.dio.post(
        ApiConst.resetMPIM,
        data: FormData.fromMap(param.toJson()),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendResetPasswordOtp({required String num}) async {
    try {
      final res = await _client.dio.post(
        ApiConst.sendResetOTPa,
        data: FormData.fromMap({"number_or_email": num}),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
