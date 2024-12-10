class StateData {
  int id;
  String name;
  bool status;
  String countryCode;

  StateData({
    required this.id,
    required this.name,
    required this.status,
    required this.countryCode,
  });

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        status: json['status'] ?? false,
        countryCode: (json["country_code"] ?? '').toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "status": status,
      };
}
