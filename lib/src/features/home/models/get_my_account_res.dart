class GetMyAccountRes {
  User? user;

  GetMyAccountRes({this.user});

  GetMyAccountRes.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? bonusPoint;
  String? email;
  String? id;
  String? mobileNumber;
  String? name;
  String? referralCode;
  bool? isTrialMode;
  String? rewardAmount;
  String? walletBalance;
  bool? registrationStatus;
  bool? accountStatus;
  Null? otherDetails;
  Address? address;
  Null? documents;
  Null? kycDetail;
  UserQualification? userQualification;
  Orders? orders;
  Null? registrationPayment;
  PermanentDistrict? role;
  UserPersonalDetail? userPersonalDetail;
  String? registrationFee;

  User(
      {this.bonusPoint,
      this.email,
      this.id,
      this.mobileNumber,
      this.name,
      this.referralCode,
      this.isTrialMode,
      this.rewardAmount,
      this.walletBalance,
      this.registrationStatus,
      this.accountStatus,
      this.otherDetails,
      this.address,
      this.documents,
      this.kycDetail,
      this.userQualification,
      this.orders,
      this.registrationPayment,
      this.role,
      this.userPersonalDetail,
      this.registrationFee});

  User.fromJson(Map<String, dynamic> json) {
    bonusPoint = json['bonus_point'];
    email = json['email'];
    id = json['id'];
    mobileNumber = json['mobile_number'];
    name = json['name'];
    referralCode = json['referral_code'];
    isTrialMode = json['is_trial_mode'];
    rewardAmount = json['reward_amount'];
    walletBalance = json['wallet_balance'];
    registrationStatus = json['registration_status'];
    accountStatus = json['account_status'];
    otherDetails = json['other_details'];
    address = json['address'] != null ? new Address.fromJson(json['address']) : null;
    documents = json['documents'];
    kycDetail = json['kyc_detail'];
    userQualification =
        json['user_qualification'] != null ? new UserQualification.fromJson(json['user_qualification']) : null;
    orders = json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    registrationPayment = json['registration_payment'];
    role = json['role'] != null ? new PermanentDistrict.fromJson(json['role']) : null;
    userPersonalDetail =
        json['user_personal_detail'] != null ? new UserPersonalDetail.fromJson(json['user_personal_detail']) : null;
    registrationFee = json['registration_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bonus_point'] = bonusPoint;
    data['email'] = email;
    data['id'] = id;
    data['mobile_number'] = mobileNumber;
    data['name'] = name;
    data['referral_code'] = referralCode;
    data['is_trial_mode'] = isTrialMode;
    data['reward_amount'] = rewardAmount;
    data['wallet_balance'] = walletBalance;
    data['registration_status'] = registrationStatus;
    data['account_status'] = accountStatus;
    data['other_details'] = otherDetails;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['documents'] = documents;
    data['kyc_detail'] = kycDetail;
    if (userQualification != null) {
      data['user_qualification'] = userQualification!.toJson();
    }
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    data['registration_payment'] = registrationPayment;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (userPersonalDetail != null) {
      data['user_personal_detail'] = userPersonalDetail!.toJson();
    }
    data['registration_fee'] = registrationFee;
    return data;
  }
}

class Address {
  Null? citizenship;
  int? permanentStateId;
  int? permanentDistrictId;
  int? permanentBlockId;
  String? permanentPincode;
  Null? permanentSubdivision;
  Null? permanentTypeOfLocality;
  Null? permanentPanchayat;
  Null? permanentViTown;
  Null? permanentPostOffice;
  Null? permanentPoliceStation;
  Null? permanentWardNo;
  String? permanentVillage;
  Null? permanentVillageId;
  Null? presentStateId;
  Null? presentDistrictId;
  Null? presentBlockId;
  Null? presentPincode;
  Null? presentSubdivision;
  Null? presentTypeOfLocality;
  Null? presentPanchayat;
  Null? presentViTown;
  Null? presentPostOffice;
  Null? presentPoliceStation;
  Null? presentWardNo;
  Null? presentVillage;
  Null? permanentCouncil;
  Null? presentCouncil;
  PermanentDistrict? permanentDistrict;
  PermanentDistrict? permanentState;
  Null? presentDistrict;
  Null? presentState;

  Address(
      {this.citizenship,
      this.permanentStateId,
      this.permanentDistrictId,
      this.permanentBlockId,
      this.permanentPincode,
      this.permanentSubdivision,
      this.permanentTypeOfLocality,
      this.permanentPanchayat,
      this.permanentViTown,
      this.permanentPostOffice,
      this.permanentPoliceStation,
      this.permanentWardNo,
      this.permanentVillage,
      this.permanentVillageId,
      this.presentStateId,
      this.presentDistrictId,
      this.presentBlockId,
      this.presentPincode,
      this.presentSubdivision,
      this.presentTypeOfLocality,
      this.presentPanchayat,
      this.presentViTown,
      this.presentPostOffice,
      this.presentPoliceStation,
      this.presentWardNo,
      this.presentVillage,
      this.permanentCouncil,
      this.presentCouncil,
      this.permanentDistrict,
      this.permanentState,
      this.presentDistrict,
      this.presentState});

  Address.fromJson(Map<String, dynamic> json) {
    citizenship = json['citizenship'];
    permanentStateId = json['permanent_state_id'];
    permanentDistrictId = json['permanent_district_id'];
    permanentBlockId = json['permanent_block_id'];
    permanentPincode = json['permanent_pincode'];
    permanentSubdivision = json['permanent_subdivision'];
    permanentTypeOfLocality = json['permanent_type_of_locality'];
    permanentPanchayat = json['permanent_panchayat'];
    permanentViTown = json['permanent_vi_town'];
    permanentPostOffice = json['permanent_post_office'];
    permanentPoliceStation = json['permanent_police_station'];
    permanentWardNo = json['permanent_ward_no'];
    permanentVillage = json['permanent_village'];
    permanentVillageId = json['permanent_village_id'];
    presentStateId = json['present_state_id'];
    presentDistrictId = json['present_district_id'];
    presentBlockId = json['present_block_id'];
    presentPincode = json['present_pincode'];
    presentSubdivision = json['present_subdivision'];
    presentTypeOfLocality = json['present_type_of_locality'];
    presentPanchayat = json['present_panchayat'];
    presentViTown = json['present_vi_town'];
    presentPostOffice = json['present_post_office'];
    presentPoliceStation = json['present_police_station'];
    presentWardNo = json['present_ward_no'];
    presentVillage = json['present_village'];
    permanentCouncil = json['permanent_council'];
    presentCouncil = json['present_council'];
    permanentDistrict =
        json['permanent_district'] != null ? new PermanentDistrict.fromJson(json['permanent_district']) : null;
    permanentState = json['permanent_state'] != null ? new PermanentDistrict.fromJson(json['permanent_state']) : null;
    presentDistrict = json['present_district'];
    presentState = json['present_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['citizenship'] = citizenship;
    data['permanent_state_id'] = permanentStateId;
    data['permanent_district_id'] = permanentDistrictId;
    data['permanent_block_id'] = permanentBlockId;
    data['permanent_pincode'] = permanentPincode;
    data['permanent_subdivision'] = permanentSubdivision;
    data['permanent_type_of_locality'] = permanentTypeOfLocality;
    data['permanent_panchayat'] = permanentPanchayat;
    data['permanent_vi_town'] = permanentViTown;
    data['permanent_post_office'] = permanentPostOffice;
    data['permanent_police_station'] = permanentPoliceStation;
    data['permanent_ward_no'] = permanentWardNo;
    data['permanent_village'] = permanentVillage;
    data['permanent_village_id'] = permanentVillageId;
    data['present_state_id'] = presentStateId;
    data['present_district_id'] = presentDistrictId;
    data['present_block_id'] = presentBlockId;
    data['present_pincode'] = presentPincode;
    data['present_subdivision'] = presentSubdivision;
    data['present_type_of_locality'] = presentTypeOfLocality;
    data['present_panchayat'] = presentPanchayat;
    data['present_vi_town'] = presentViTown;
    data['present_post_office'] = presentPostOffice;
    data['present_police_station'] = presentPoliceStation;
    data['present_ward_no'] = presentWardNo;
    data['present_village'] = presentVillage;
    data['permanent_council'] = permanentCouncil;
    data['present_council'] = presentCouncil;
    if (permanentDistrict != null) {
      data['permanent_district'] = permanentDistrict!.toJson();
    }
    if (permanentState != null) {
      data['permanent_state'] = permanentState!.toJson();
    }
    data['present_district'] = presentDistrict;
    data['present_state'] = presentState;
    return data;
  }
}

class PermanentDistrict {
  String? name;

  PermanentDistrict({this.name});

  PermanentDistrict.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class UserQualification {
  String? qualificationDegree;
  String? tenthMarksheet;
  Null? twelevethMarksheet;
  Null? graduateMarksheet;
  Null? mastersMarksheet;

  UserQualification(
      {this.qualificationDegree,
      this.tenthMarksheet,
      this.twelevethMarksheet,
      this.graduateMarksheet,
      this.mastersMarksheet});

  UserQualification.fromJson(Map<String, dynamic> json) {
    qualificationDegree = json['qualification_degree'];
    tenthMarksheet = json['tenth_marksheet'];
    twelevethMarksheet = json['tweleveth_marksheet'];
    graduateMarksheet = json['graduate_marksheet'];
    mastersMarksheet = json['masters_marksheet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qualification_degree'] = qualificationDegree;
    data['tenth_marksheet'] = tenthMarksheet;
    data['tweleveth_marksheet'] = twelevethMarksheet;
    data['graduate_marksheet'] = graduateMarksheet;
    data['masters_marksheet'] = mastersMarksheet;
    return data;
  }
}

class Orders {
  int? totalCount;

  Orders({this.totalCount});

  Orders.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    return data;
  }
}

class UserPersonalDetail {
  String? bloodGroup;
  String? cast;
  String? category;
  String? dob;
  String? email;
  String? fatherName;
  String? gender;
  String? id;
  String? mobileNumber;
  String? motherName;
  String? name;
  String? picture;
  Null? pincode;
  String? profession;
  String? religion;
  Null? shopName;

  UserPersonalDetail(
      {this.bloodGroup,
      this.cast,
      this.category,
      this.dob,
      this.email,
      this.fatherName,
      this.gender,
      this.id,
      this.mobileNumber,
      this.motherName,
      this.name,
      this.picture,
      this.pincode,
      this.profession,
      this.religion,
      this.shopName});

  UserPersonalDetail.fromJson(Map<String, dynamic> json) {
    bloodGroup = json['blood_group'];
    cast = json['cast'];
    category = json['category'];
    dob = json['dob'];
    email = json['email'];
    fatherName = json['father_name'];
    gender = json['gender'];
    id = json['id'];
    mobileNumber = json['mobile_number'];
    motherName = json['mother_name'];
    name = json['name'];
    picture = json['picture'];
    pincode = json['pincode'];
    profession = json['profession'];
    religion = json['religion'];
    shopName = json['shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blood_group'] = bloodGroup;
    data['cast'] = cast;
    data['category'] = category;
    data['dob'] = dob;
    data['email'] = email;
    data['father_name'] = fatherName;
    data['gender'] = gender;
    data['id'] = id;
    data['mobile_number'] = mobileNumber;
    data['mother_name'] = motherName;
    data['name'] = name;
    data['picture'] = picture;
    data['pincode'] = pincode;
    data['profession'] = profession;
    data['religion'] = religion;
    data['shop_name'] = shopName;
    return data;
  }
}
