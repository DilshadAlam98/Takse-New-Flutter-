class DistrictData {
  int id;
  String name;

  DistrictData({
    required this.id,
    required this.name,
  });

  factory DistrictData.fromJson(Map<String, dynamic> json) => DistrictData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
