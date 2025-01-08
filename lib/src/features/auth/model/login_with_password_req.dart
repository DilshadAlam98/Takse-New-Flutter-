class LoginWithPasswordRequest {
  String mobileNumber;
  String mpin;
  String fcmToken;

  LoginWithPasswordRequest({
    required this.mobileNumber,
    required this.mpin,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        "mobile_number": mobileNumber,
        "mpin": mpin,
        "fcm_token": fcmToken,
      };
}
