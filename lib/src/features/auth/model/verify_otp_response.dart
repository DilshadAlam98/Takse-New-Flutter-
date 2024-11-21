class VerifyOtpResponse {
  bool status;
  String response;

  VerifyOtpResponse({
    required this.status,
    required this.response,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
        status: json["status"] ?? false,
        response: json["response"] ?? "",
      );
}
