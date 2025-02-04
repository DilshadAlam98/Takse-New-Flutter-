// To parse this JSON data, do
//
//     final paymentRequest = paymentRequestFromJson(jsonString);

class PaymentRequest {
  String? amount;
  String mobileNumber;
  String? orderid;
  String? couponId;
  String paymentfor;

  PaymentRequest({this.amount, required this.mobileNumber, this.orderid, required this.paymentfor, this.couponId});

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};

    if (amount != null) {
      data['amount'] = amount;
    }
    data['phone'] = mobileNumber;
    if (orderid != null) {
      data['order_id'] = orderid;
    }
    if (couponId != null) {
      data['coupon_id'] = couponId;
    }
    data['payment_for'] = paymentfor;
    return data;
  }
}
