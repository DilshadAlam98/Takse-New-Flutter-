class LoginWithPasswordResponse {
  bool status;
  String token;
  String message;
  String userid;

  LoginWithPasswordResponse({
    required this.status,
    required this.token,
    required this.message,
    required this.userid,
  });

  factory LoginWithPasswordResponse.fromJson(Map<String, dynamic> json) => LoginWithPasswordResponse(
        status: json["status"] ?? false,
        token: json["token"] ?? '',
        message: json["message"] ?? '',
        userid: (json['user_id'] ?? 0).toString(),
      );

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "token": token,
      "message": message,
      "user_id": int.tryParse(userid) ?? 0,
    };
  }
}
