class CityData {
  int id;
  String name;
  String stateId;
  String isDistrict;

  CityData({
    required this.id,
    required this.name,
    required this.stateId,
    required this.isDistrict,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        stateId: json["state_id"] ?? '',
        isDistrict: json["is_district"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "is_district": isDistrict,
      };
}
