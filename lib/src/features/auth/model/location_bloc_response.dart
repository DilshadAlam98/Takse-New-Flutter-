class LocationBlock {
  int id;
  String name;
  String pincode;

  LocationBlock({required this.id, required this.name, required this.pincode});

  factory LocationBlock.fromJson(Map<String, dynamic> json) => LocationBlock(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        pincode: json['pincode'] ?? '',
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, 'pincode': pincode};
}
