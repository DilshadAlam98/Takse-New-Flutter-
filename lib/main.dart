import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:takse/core/base/navigation.dart';
import 'package:takse/core/config/api_config/rest_client.dart';
import 'package:takse/core/constant/api_const.dart';
import 'package:takse/core/routes/app_pages.dart';
import 'package:takse/core/theme/app_theme.dart';
import 'package:takse/src/features/auth/screens/registration_screen.dart';

void main() {
  RestClient.getInstance(baseUrl: ApiConst.baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      getPages: AppPages.getPageBindings(),
      theme: AppTheme.getAppTheme(),
      home: const Registration(),
    );
  }
}
