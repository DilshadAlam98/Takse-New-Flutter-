import 'package:takse/core/constant/asset_const.dart';

class DrawerEntity {
  final String label;
  final int? index;
  final String? asset;

  DrawerEntity({required this.label, this.index, this.asset});

  static List<DrawerEntity> getSideMenuOptions() {
    return [
      DrawerEntity(label: "Convert into Business User", asset: AssetConst.cooperation),
      DrawerEntity(label: "Profile Update", asset: AssetConst.user),
      DrawerEntity(label: "Manage Order", asset: AssetConst.manageOrder),
      DrawerEntity(label: "My Business Report", asset: AssetConst.business),
      DrawerEntity(label: "My Coupon", asset: AssetConst.group),
      DrawerEntity(label: "My wish list", asset: AssetConst.list),
      DrawerEntity(label: "Refer and earn", asset: AssetConst.referAndEarn),
      DrawerEntity(label: "Generate Certificate", asset: AssetConst.certificate),
    ];
  }

  static List<DrawerEntity> getCompanyDrawerOptions() {
    return [
      DrawerEntity(label: "About Us", asset: AssetConst.aboutUs),
      DrawerEntity(label: "Privacy Policy", asset: AssetConst.privacyAndPolicy),
      DrawerEntity(label: "Refund Policy", asset: AssetConst.cashback),
      DrawerEntity(label: "Terms and Condition", asset: AssetConst.termsAndConditions),
      DrawerEntity(label: "Company Documents", asset: AssetConst.companyDocs),
      DrawerEntity(label: "Contact Us", asset: AssetConst.email),
    ];
  }

  static List<DrawerEntity> getSettingsDrawerOptions() {
    return [
      DrawerEntity(label: "My Settings", asset: AssetConst.settings),
      DrawerEntity(label: "Select Theme", asset: AssetConst.theme),
      DrawerEntity(label: "Select Language", asset: AssetConst.language),
      DrawerEntity(label: "Subscribe To Alert", asset: AssetConst.notificationBell),
      DrawerEntity(label: "App Update", asset: AssetConst.appUpdate),
      DrawerEntity(label: "Logout", asset: AssetConst.logout),
    ];
  }
}
