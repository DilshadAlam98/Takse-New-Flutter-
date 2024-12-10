import 'package:get/get.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/src/features/auth/model/city_data.dart';
import 'package:takse/src/features/auth/model/district_data.dart';
import 'package:takse/src/features/auth/model/location_bloc_response.dart';
import 'package:takse/src/features/auth/model/state_response.dart';
import 'package:takse/src/features/auth/model/user_type_entity.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

class RegistrationController extends GetxController {
  UserTypeEntity? userType;
  List<StateData>? states;
  List<DistrictData>? districts;
  List<CityData>? cities;
  List<LocationBlock>? blocks;
  StateData? selectedState;
  DistrictData? selectedDistrict;
  CityData? selectedCity;
  LocationBlock? selectedBloc;
  final _source = ApiSource();

  void selectUser(UserTypeEntity type) {
    userType = type;
    update(['registration-first']);
  }

  @override
  void onInit() {
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
}
