class RegisterRequest {
  final String name;
  final String email;
  final String roleId;
  final String mobileNo;
  final String blockId;
  final String stateId;
  final String districtId;
  final String password;
  final String pincCode;
  final String? referralCode;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.roleId,
    required this.mobileNo,
    required this.blockId,
    required this.stateId,
    required this.districtId,
    required this.password,
    required this.pincCode,
    this.referralCode,
  });
}
