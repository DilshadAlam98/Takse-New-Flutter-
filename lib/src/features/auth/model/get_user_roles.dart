import 'package:flutter/material.dart';

import '../../../../core/constant/asset_const.dart';
import '../../../../core/theme/app_colors.dart';

class GetUserRoles {
  int id;
  String role;

  final String desc;
  final String asset;
  final Color color;

  GetUserRoles({
    required this.id,
    required this.role,
    required this.desc,
    this.asset = "",
    this.color = Colors.transparent,
  });

  factory GetUserRoles.fromJson(Map<String, dynamic> json) => GetUserRoles(
        id: json["user_type_id"] ?? 0,
        role: json["name"].toString().toLowerCase() == "tsp"
            ? " TSP-TakSe Single Person"
            : json["name"].toString().toLowerCase() == "tbp"
                ? "TBP - TakSe Business Partner"
                : json["name"],
        color: json["name"].toLowerCase() == 'tbp' ? AppColors.purple : AppColors.green,
        asset: json["name"].toLowerCase() == 'tbp' ? AssetConst.profile2 : AssetConst.profile1,
        desc: json["name"].toLowerCase() == 'tcp'
            ? 'छोटे या बड़े व्यवसाय वाले लोग, जैसे सिम रिचार्ज, किराना दुकान, आदि, टकसे सर्विस मॉल खोलकर और डिजिटल बिजनेस संवाददाता बनकर अपनी आय बढ़ा सकते हैं।'
            : "कोई भी भारतीय नागरिक FREE में पंजीकरण कर सकता है और टकसे ऐप की मदद से कोई भी फॉर्म / दस्तावेज की आवेदन घर बैठे करवा सकता है",
      );

  Map<String, dynamic> toJson() => {"user_type_id": id, "name": role};
}
