class LoginOneStep {
  bool isRegistered;
  String otp;

  LoginOneStep({required this.isRegistered, required this.otp});

  factory LoginOneStep.fromJson(Map<String, dynamic> json) =>
      LoginOneStep(isRegistered: json["isRegistered"] ?? false, otp: json["otp"] ?? "0");

  Map<String, dynamic> toJson() => {
        "isRegistered": isRegistered,
        "otp": otp,
      };
}
