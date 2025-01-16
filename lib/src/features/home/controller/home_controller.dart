import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/local/app_session.dart';
import 'package:takse/core/local/local_const.dart';
import 'package:takse/src/features/home/models/get_my_account_res.dart';
import 'package:takse/src/features/notifications/models/get_home_response.dart';
import 'package:takse/src/features/notifications/models/get_social_media_link_res.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';

class HomeController extends GetxController {
  GetMyAccountRes? accountRes;
  Rx<GetSocialMediaRes>? socialLinks;
  Rx<List?> banners = Rx(null);
  Rx<GetHomeRes>? homeData;

  final apiSource = ApiSource();
  final _appSession = AppSession();
  Rx<int?> notificationCount = Rx<int?>(null);

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        fetchApis();
      },
    );
    super.onInit();
  }

  void fetchApis() async {
    try {
      AppDialog.showLoader();
      await Future.wait([
        getMyProfileAccount(),
        getSocialMediaLinks(),
        getBanners(),
        getHome(),
      ]);
      AppDialog.hideLoader();
    } catch (e) {
      AppDialog.hideLoader();
    }
  }

  Future<void> getMyProfileAccount() async {
    sendRequest(
      onTry: () async {
        final data = await apiSource.getMyAccountDetails();
        accountRes = data;
        await _appSession.setString(key: LocalConst.profileDetails, value: jsonEncode(data.toJson()));
      },
      onError: (e) {
        AppDialog.showSuccessSnackBar(message: e.message);
      },
    );
  }

  Future<void> getSocialMediaLinks() async {
    sendRequest(
      onTry: () async {
        final data = await apiSource.getSocialMediaLinks();
        socialLinks?.value = data;
      },
      onError: (e) {},
    );
  }

  Future<void> getBanners() async {
    sendRequest(
      onTry: () async {
        final data = await apiSource.getBanners();
        banners.value = data;
      },
      onError: (e) {},
    );
  }

  Future<void> getHome() async {
    sendRequest(
      onTry: () async {
        final data = await apiSource.getHomeRes();
        homeData?.value = data;
      },
      onError: (e) {},
    );
  }
}
