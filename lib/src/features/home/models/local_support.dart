class LocalSupport {
  String name;
  String number;

  LocalSupport({
    required this.name,
    required this.number,
  });

  factory LocalSupport.fromJson(Map<String, dynamic> json) => LocalSupport(
        name: json["name"] ?? "",
        number: json["phone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": number,
      };
}
