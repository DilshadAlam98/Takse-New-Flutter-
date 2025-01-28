import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:takse/core/base/navigation.dart';
import 'package:takse/core/config/api_config/rest_client.dart';
import 'package:takse/core/constant/api_const.dart';
import 'package:takse/core/local/app_session.dart';
import 'package:takse/core/local/local_const.dart';
import 'package:takse/core/routes/app_pages.dart';
import 'package:takse/core/theme/app_theme.dart';
import 'package:takse/src/features/auth/model/login_with_password_res.dart';
import 'package:takse/src/features/auth/screens/enter_your_mobile_screen.dart';
import 'package:takse/src/shared_widget/bottom_nav_bar.dart';
import 'package:takse/src/shared_widget/bottom_nav_controller.dart';

void main() async {
  RestClient.getInstance(baseUrl: ApiConst.baseUrl);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginWithPasswordResponse? loginUser;

  @override
  void initState() {
    getLoginUser();
    super.initState();
  }

  void getLoginUser() async {
    final user = await AppSession().getString(LocalConst.loginDetails);
    if (user == null) return;
    loginUser = LoginWithPasswordResponse.fromJson(jsonDecode(user));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navigatorKey,
          getPages: AppPages.getPageBindings(),
          initialBinding: BindingsBuilder(() => BottomNavController()),
          theme: AppTheme.getAppTheme(),
          home: loginUser == null ? EnterYourMobileScreen() : const CommonBottomAppBar(),
        );
      },
    );
  }
}
