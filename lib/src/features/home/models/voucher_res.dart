class VoucherRes {
  String? message;
  bool? success;
  bool? error;
  String? couponId;
  int? finalAmount;

  VoucherRes({this.message, this.success, this.couponId, this.finalAmount, this.error});

  VoucherRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    error = json['error'];
    couponId = json['coupon_id'];
    finalAmount = json['final_amount'];
  }
}
