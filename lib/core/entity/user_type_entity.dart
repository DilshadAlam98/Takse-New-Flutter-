import 'package:flutter/material.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_colors.dart';

class UserTypeEntity {
  final String label;
  final String desc;
  final int index;
  final String? asset;
  final Color color;

  UserTypeEntity({required this.label, required this.desc, required this.index, this.asset, required this.color});

  static List<UserTypeEntity> getUserTypes() {
    return [
      UserTypeEntity(
          label: "TSP - TakSe Single Person",
          desc:
              'कोई भी भारतीय नागरिक FREE में पंजीकरण कर सकता है और टकसे ऐप की मदद से कोई भी फॉर्म / दस्तावेज की आवेदन घर बैठे करवा सकता है ',
          index: 0,
          color: AppColors.green,
          asset: AssetConst.profile1),
      UserTypeEntity(
          label: "TBP - TakSe Business Partner",
          desc:
              'छोटे या बड़े व्यवसाय वाले लोग, जैसे सिम रिचार्ज, किराना दुकान, आदि, टकसे सर्विस मॉल खोलकर और डिजिटल बिजनेस संवाददाता बनकर अपनी आय बढ़ा सकते हैं।',
          index: 0,
          color: AppColors.purple,
          asset: AssetConst.profile2),
    ];
  }
}
