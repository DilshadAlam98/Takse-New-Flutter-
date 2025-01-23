class ForgetPasswordReq {
  String mobileNumber;
  String newMpin;
  String otp;

  ForgetPasswordReq({
    required this.mobileNumber,
    required this.newMpin,
    required this.otp,
  });

  Map<String, dynamic> toJson() => {
        "mobile_number": mobileNumber,
        "new_mpin": newMpin,
        "otp": otp,
      };
}
