class MyNotificationRes {
  String? id;
  String? message;
  String? createdAt;
  bool? isRead;

  MyNotificationRes({this.id, this.message, this.createdAt, this.isRead});

  MyNotificationRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    createdAt = json['created_at'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['is_read'] = this.isRead;
    return data;
  }
}
