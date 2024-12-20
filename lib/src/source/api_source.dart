import 'package:dio/dio.dart';
import 'package:takse/core/config/api_config/rest_client.dart';
import 'package:takse/core/constant/api_const.dart';
import 'package:takse/src/features/auth/model/city_data.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/getpincode_res.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/login_one_step.dart';
import 'package:takse/src/features/auth/model/register_req.dart';
import 'package:takse/src/features/auth/model/verify_otp_response.dart';

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
}
