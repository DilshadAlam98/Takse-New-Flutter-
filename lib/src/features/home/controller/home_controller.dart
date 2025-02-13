import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:takse/core/components/app_webview.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/local/app_session.dart';
import 'package:takse/core/local/local_const.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/src/features/home/models/get_all_categories.dart';
import 'package:takse/src/features/home/models/get_all_type_service_res.dart';
import 'package:takse/src/features/home/models/get_my_account_res.dart';
import 'package:takse/src/features/notifications/models/get_home_response.dart';
import 'package:takse/src/features/notifications/models/get_social_media_link_res.dart';
import 'package:takse/src/source/api_source.dart';
import 'package:takse/src/utils/app_dialog.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../notifications/models/get_banners_res.dart';
import '../models/payment_request.dart';

class HomeController extends GetxController {
  GetMyAccountRes? accountRes;
  Rx<GetSocialMediaRes>? socialLinks;
  List<GetBannersRes> banners = [];
  Rx<GetHomeRes>? homeData;

  GetAllCategories? allCategories;
  ServicesNode? govtService;
  ServicesNode? topService;
  ServicesNode? govtSchemes;

  final couponCodeController = TextEditingController();

  RxString registrationFee = "".obs;

  bool isLoading = false;

  final apiSource = ApiSource();
  final _appSession = AppSession();
  Rx<int?> notificationCount = Rx<int?>(null);

  @override
  void onReady() {
    fetchApis();
    super.onReady();
  }

  void fetchApis() async {
    try {
      isLoading = true;
      update();

      await Future.wait([
        getMyProfileAccount(),
        getSocialMediaLinks(),
        getBanners(),
        getAllCategories(),
        getGovtService(),
        getTopService(),
        getGovtSchemeService(),
      ]);

      isLoading = false;
      update(); // Notify UI after data is fetched
    } catch (e) {
      AppDialog.showErrorSnackBar(message: "Failed to Fetch");
      isLoading = false;
      update(); // Ensure UI updates even on error
    }
  }

  Future<void> getMyProfileAccount() async {
    sendRequest(
      onTry: () async {
        final data = await apiSource.getMyAccountDetails();
        accountRes = data;
        registrationFee.value = data.user?.registrationFee.toString() ?? "";
        await _appSession.setString(key: LocalConst.profileDetails, value: jsonEncode(data.toJson()));
        // update();
        if (data.user?.registrationStatus == false) {
          // Get.off(const PaymentScreen());
        }
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
        banners = data;
        update();
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

  void validateCoupon() async {
    if (couponCodeController.text.isEmpty) {
      AppDialog.showErrorSnackBar(message: "Please enter coupon code");
      return;
    }
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final res = await apiSource.validateCoupon(
          amount: registrationFee.value,
          code: couponCodeController.text.trim(),
        );

        if (res.message?.toLowerCase() == "invalid coupon") {
          AppDialog.hideLoader();
          AppDialog.showErrorSnackBar(message: res.message);
        }
        registrationFee.value = res.finalAmount?.toString() ?? "";

        AppDialog.hideLoader();
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  void payNow() {
    AppDialog.showLoader();

    sendRequest(
      onTry: () async {
        PaymentRequest request = PaymentRequest(
          amount: registrationFee.toString(),
          mobileNumber: accountRes?.user?.mobileNumber.toString() ?? "",
          paymentfor: 'REGISTRATION',
        );
        final res = await apiSource.getPaymentUrl(request);
        if (res.status == true) {
          await Get.to(() => WebViewContainer(url: res.paymentUrl));
          checkPaymentsStatus(res.transactionId);
        } else {
          AppDialog.hideLoader();
        }
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  void needTrial() {
    sendRequest(
      onTry: () async {
        AppDialog.showLoader();
        final stateId = accountRes?.user?.address?.permanentStateId ?? 0;
        final res = await apiSource.getLocalSupport(stateId);
        if (res.number.isEmpty) {
          AppDialog.showErrorSnackBar(message: "Support not available at the moment");
          AppDialog.hideLoader();
          return;
        }
        AppDialog.hideLoader();

        launchUrlString('tel: ${res.number}');
      },
      onError: (e) {
        AppDialog.hideLoader();
        AppDialog.showErrorSnackBar(message: e.message);
      },
    );
  }

  Future<void> checkPaymentsStatus(String orderId) async {
    sendRequest(
      onTry: () async {
        final res = await apiSource.getPaymentStatus(orderId);
        if (res.status == true) {
          Get.offAllNamed(RouteConst.homeScreen);
        }
        AppDialog.showLoader();
      },
      onError: (e) {
        AppDialog.showLoader();
      },
    );
  }

  Future<void> getAllCategories() async {
    sendRequest(
      onTry: () async {
        final res = await apiSource.getAllCategories();
        allCategories = res;
        update();
      },
      onError: (e) {
        console("Error in all categories::: $e");
      },
    );
  }

  Future<void> getGovtService() async {
    try {
      sendRequest(
        onTry: () async {
          final res = await apiSource.getServicesByType(serviceType: "Sarkari Forms");
          govtService = res.data?.services;
          update();
        },
        onError: (e) {},
      );
    } catch (e) {
      console("Error from Sarkari Forms");
    }
  }

  Future<void> getTopService() async {
    try {
      sendRequest(
        onTry: () async {
          final res = await apiSource.getServicesByType(serviceType: "Top");
          topService = res.data?.services;
          update();
        },
        onError: (e) {},
      );
    } catch (e) {
      console("Error from Top Service");
    }
  }

  Future<void> getGovtSchemeService() async {
    try {
      sendRequest(
        onTry: () async {
          final res = await apiSource.getServicesByType(serviceType: "Govt. Schemes");
          govtSchemes = res.data?.services;
          update();
        },
        onError: (e) {},
      );
    } catch (e) {
      console("Error from Govt. Schemes");
    }
  }
}
