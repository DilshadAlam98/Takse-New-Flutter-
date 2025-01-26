class RegistrationReq {
  String? name;
  String? email;
  int? role;
  String? addressLine1;
  String? addressLine2;
  int? state;
  int? district;
  int? pincode;
  int? city;
  String? referalCode;
  int? mobileNumber;
  int? otp;
  String? password;
  int? block;
  String? shopName;
  String? villageName;

  RegistrationReq({
    this.name,
    this.email,
    this.role,
    this.addressLine1,
    this.addressLine2,
    this.state,
    this.district,
    this.block,
    this.pincode,
    this.city,
    this.referalCode,
    this.mobileNumber,
    this.otp,
    this.password,
    this.shopName,
    this.villageName,
  });

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "email": email ?? '',
        "role_id": role ?? 0,
        'block_id': block ?? 1,
        "state_id": state ?? 1,
        "district_id": district ?? 1,
        "pincode": pincode ?? 1,
        "referral_code": referalCode ?? '',
        "mobile_number": mobileNumber ?? 0,
        "otp": otp ?? 0,
        "password": password.toString(),
        "shop_name": shopName ?? '',
        "village_name": villageName ?? '',
      };
}
