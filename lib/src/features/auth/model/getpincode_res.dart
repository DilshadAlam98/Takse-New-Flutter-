import 'package:takse/src/features/auth/model/district_data.dart';

class GetPinCode {
  DistrictData? district;
  DistrictData? state;

  GetPinCode({this.district, this.state});

  GetPinCode.fromJson(Map<String, dynamic> json) {
    district = json['district'] != null ? DistrictData.fromJson(json['district']) : null;
    state = json['state'] != null ? DistrictData.fromJson(json['state']) : null;
  }
}
