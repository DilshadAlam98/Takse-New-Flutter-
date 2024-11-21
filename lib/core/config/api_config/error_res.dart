class ErrorRes {
  final bool? status;
  final String? title;
  final String? message;

  ErrorRes({
    this.status,
    this.title,
    this.message = "Something Went Wrong",
  });

  factory ErrorRes.fromJson(Map<String, dynamic> json) => ErrorRes(
        status: json["status"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "message": message,
      };
}
