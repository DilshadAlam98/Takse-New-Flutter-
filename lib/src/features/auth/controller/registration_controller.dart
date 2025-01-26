import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/src/features/auth/controller/otp_controller.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/get_user_roles.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/register_req.dart';
import 'package:takse/src/features/auth/model/state_response.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

import '../../../../core/routes/route_const.dart';

class RegistrationController extends GetxController {
  /// Field Controllers--------
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final referralController = TextEditingController();
  final mPInController = TextEditingController();
  final areaPinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// States District Variable....
  List<StateData>? states;
  List<DistrictData>? districts;

  // List<CityData>? cities;
  List<LocationBlock>? blocks;
  StateData? selectedState;
  DistrictData? selectedDistrict;

  // CityData? selectedCity;
  LocationBlock? selectedBlock;
  final _source = ApiSource();
  RxList<GetUserRoles?> userRoles = RxList();

  GetUserRoles? selectedUserRole;

  RxBool isAgreed = false.obs;

  /// Validators---------------
  String? validateName(String? name) {
    if (name.isNullOrEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email.isNullOrEmpty) {
      return "Please enter your e-mail ID";
    }
    return null;
  }

  String? validateMPin(String? mpPin) {
    if (mpPin.isNullOrEmpty) {
      return "Please enter your mPIn";
    } else if (mpPin!.length < 4) {
      return "Please enter pin of 4 digit";
    }
    return null;
  }

  String? validateAreaPin(String? pin) {
    if (pin.isNullOrEmpty) {
      return "Please enter your area Pin";
    }
    return null;
  }

  String? validateState(StateData? state) {
    if (state == null) {
      return "Please select state";
    }
    return null;
  }

  String? validateDistrict(DistrictData? district) {
    if (district == null) {
      return "Please select district";
    }
    return null;
  }

  String? validateBlock(LocationBlock? city) {
    if (city == null) {
      return "Please select bloc/city";
    }
    return null;
  }

  String? validateVillage(LocationBlock? village) {
    if (village == null) {
      return "Please select village";
    }
    return null;
  }

  void checkTermsAndConditions() {
    isAgreed.toggle();
    update();
  }

  @override
  void onInit() {
    getUserRoles();
    getStates();
    super.onInit();
  }

  void getUserRoles() async {
    sendRequest(
      onTry: () async {
        // AppDialog.showLoader();
        final data = await _source.getUserRoles();
        data.removeWhere((element) => element.role.toLowerCase() == 'tap');
        userRoles.addAll(data);
        // AppDialog.hideLoader();
      },
      onError: (e) {
        // AppDialog.hideLoader();
        print("Error:: $e");
      },
    );
  }

  void selectUserRole(GetUserRoles? role) {
    selectedUserRole = role;
    Get.toNamed(RouteConst.registration);
  }

  void getStates() {
    sendRequest(
      onTry: () async {
        final data = await _source.getStates();
        states = data;
        update();
      },
      onError: (e) {
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  void onStateChange(StateData state) {
    selectedState = state;
    selectedDistrict = null;
    // selectedCity = null;
    selectedBlock = null;
    update();
    _getDistrict(state.id);
  }

  Future<void> _getDistrict(int id) async {
    sendRequest(
      onTry: () async {
        final data = await _source.getDistrict(id);
        districts = data;
        update();
      },
      onError: (e) {},
    );
  }

  void onDistrictChange(DistrictData district) {
    selectedDistrict = district;
    // selectedCity = null;
    selectedBlock = null;
    update();
    _getBlocks(district.id);
  }

  // void _getCities(int id) async {
  //   sendRequest(
  //     onTry: () async {
  //       final data = await _source.getCities(id);
  //       // cities = data;
  //       update();
  //     },
  //     onError: (e) {},
  //   );
  // }

  void onBlocChange(LocationBlock block) {
    selectedBlock = block;

    update();
    // _getCities(block.id);
  }

  void _getBlocks(int id) {
    sendRequest(
      onTry: () async {
        final data = await _source.getBlocks(id);
        blocks = data;
        update();
      },
      onError: (e) {},
    );
  }

  void registerUser() {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final otpController = Get.find<OtpController>();
        final param = RegistrationReq(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          role: 0,
          mobileNumber: int.parse(otpController.number.trim()),
          block: selectedBlock!.id,
          state: selectedState!.id,
          district: selectedDistrict!.id,
          otp: int.parse(otpController.otpController.text.trim()),
          password: mPInController.text.trim(),
          pincode: int.parse(areaPinController.text),
          referalCode: referralController.text.trim(),
        );
        final result = await _source.registerUser(param);
        AppDialog.hideLoader();
        AppDialog.showSuccessSnackBar(message: result);
        Get.toNamed(RouteConst.homeScreen);
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  void getPinCodeWiseData(String val) {
    DeBouncer(const Duration(milliseconds: 1500)).run(
      () {
        sendRequest(
          onTry: () async {
            selectedState = null;
            selectedDistrict = null;
            update();
            final result = await _source.getPinCodeWiseData(val);

            final state = states?.where((element) => element.id == result.firstOrNull?.state?.id).firstOrNull;
            final districtResult = await _source.getDistrict(state!.id);
            districts = districtResult;

            final dis = districtResult
                .where((element) => element.name.toLowerCase() == result.firstOrNull?.district?.name.toLowerCase())
                .firstOrNull;
            final block = await _source.getBlocks(dis!.id);
            blocks = block;
            selectedState = state;
            selectedDistrict = dis;
            update();
          },
          onError: (e) {
            console("Printing Error...... $e");
          },
        );
      },
    );
  }
}
