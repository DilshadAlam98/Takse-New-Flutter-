import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/entity/user_type_entity.dart';
import 'package:takse/src/features/auth/model/city_data.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/register_req.dart';
import 'package:takse/src/features/auth/model/state_response.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

class RegistrationController extends GetxController {
  /// Field Controllers--------
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final referralController = TextEditingController();
  final mobileController = TextEditingController();
  final mPInController = TextEditingController();
  final areaPinController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// States District Variable....
  List<StateData>? states;
  List<DistrictData>? districts;
  List<CityData>? cities;
  List<LocationBlock>? blocks;
  StateData? selectedState;
  DistrictData? selectedDistrict;
  CityData? selectedCity;
  LocationBlock? selectedBloc;
  final _source = ApiSource();
  late UserTypeEntity? userTypeEntity;

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

  String? validateBlock(CityData? city) {
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
    userTypeEntity = Get.arguments['userType'];
    getStates();
    super.onInit();
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
    selectedCity = null;
    selectedBloc = null;
    update();
    _getDistrict(state.id);
  }

  void _getDistrict(int id) async {
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
    selectedCity = null;
    selectedBloc = null;
    update();
    _getCities(district.id);
  }

  void _getCities(int id) async {
    sendRequest(
      onTry: () async {
        final data = await _source.getCities(id);
        cities = data;
        update();
      },
      onError: (e) {},
    );
  }

  void onCityChange(CityData city) {
    selectedCity = city;
    selectedBloc = null;
    update();
    _getBlocks(city.id);
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

  void onBlockChange(LocationBlock block) {
    selectedBloc = block;
    update();
  }

  void registerUser() {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final param = RegisterRequest(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          roleId: 'roleId',

          /// TODO,
          mobileNo: mobileController.text.trim(),
          blockId: selectedBloc!.id.toString(),
          stateId: selectedState!.id.toString(),
          districtId: selectedDistrict!.id.toString(),
          password: mPInController.text.trim(),
          pincCode: areaPinController.text.trim(),
          referralCode: referralController.text.trim(),
        );
        final res = await _source.registerUser(param);
        AppDialog.hideLoader();
        AppDialog.showSuccessSnackBar(message: res);
      },
      onError: (e) {
        AppDialog.hideLoader();
      },
    );
  }

  void getPinCode(String val) {
    DeBouncer(const Duration(milliseconds: 2000)).run(
      () {
        sendRequest(
          onTry: () async {
            final data = await _source.getPinCode(val);
            // selectedState = StateData(id: data.firstOrNull!.state!.id, name: data.firstOrNull!.state!.name);
            // update();
          },
          onError: (e) {
            console("Printing Error...... $e");
          },
        );
      },
    );
  }
}
