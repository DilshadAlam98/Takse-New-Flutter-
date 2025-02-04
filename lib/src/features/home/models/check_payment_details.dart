class CheckPaymentStatus {
  bool status;
  String code;
  String message;
  Details details;

  CheckPaymentStatus({
    required this.status,
    required this.details,
    required this.code,
    required this.message,
  });

  factory CheckPaymentStatus.fromJson(Map<String, dynamic> json) => CheckPaymentStatus(
        status: json["success"] ?? false,
        code: json["code"] ?? "",
        message: json["message"] ?? "",
        details: Details.fromJson(json["data"] ??
            {
              "id": null,
              "user_id": null,
              "amount": null,
              "payment_method": null,
              "payment_for": null,
              "transaction_id": null,
              "status": null,
              "reference_id": null,
              "created_at": null,
              "updated_at": null,
            }),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": details.toJson(),
      };
}

class Details {
  Details({
    required this.merchantId,
    required this.merchantTransactionId,
    required this.paymentInstrument,
    required this.feesContext,
    required this.responseCode,
    required this.amount,
    required this.transactionId,
    required this.state,
  });
  String merchantId;
  String merchantTransactionId;
  String transactionId;
  int amount;
  String state;
  String responseCode;
  PaymentInstrument paymentInstrument;
  FeesContext feesContext;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        merchantId: json["merchantId"] ?? "",
        merchantTransactionId: json["merchantTransactionId"] ?? "",
        transactionId: json["transactionId"] ?? "",
        amount: json["amount"] ?? 0,
        state: json["state"] ?? "",
        responseCode: json["responseCode"] ?? "",
        paymentInstrument: PaymentInstrument.fromJson(json["paymentInstrument"] ?? {}),
        feesContext: FeesContext.fromJson(json["feesContext"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "merchantId": merchantId,
        "merchantTransactionId": merchantTransactionId,
        "transactionId": transactionId,
        "amount": amount,
        "state": state,
        "responseCode": responseCode,
        "paymentInstrument": paymentInstrument.toJson(),
        "feesContext": feesContext.toJson(),
      };
}

class FeesContext {
  int amount;

  FeesContext({
    required this.amount,
  });

  factory FeesContext.fromJson(Map<String, dynamic> json) => FeesContext(
        amount: json["amount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class PaymentInstrument {
  String type;
  String utr;
  dynamic cardNetwork;
  String accountType;

  PaymentInstrument({
    required this.type,
    required this.utr,
    required this.cardNetwork,
    required this.accountType,
  });

  factory PaymentInstrument.fromJson(Map<String, dynamic> json) => PaymentInstrument(
        type: json["type"] ?? "",
        utr: json["utr"] ?? "",
        cardNetwork: json["cardNetwork"] ?? "",
        accountType: json["accountType"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "utr": utr,
        "cardNetwork": cardNetwork,
        "accountType": accountType,
      };
}
