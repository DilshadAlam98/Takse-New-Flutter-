class PaymentUrl {
  bool status;
  String paymentUrl;
  String transactionId;

  PaymentUrl({required this.status, required this.paymentUrl, required this.transactionId});

  factory PaymentUrl.fromJson(Map<String, dynamic> json) => PaymentUrl(
        transactionId: json["transaction_id"] ?? "",
        status: json["status"] ?? false,
        paymentUrl: json["payment_url"] ?? '',
      );
}
