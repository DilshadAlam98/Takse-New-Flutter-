import 'package:get/get.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/src/features/auth/controller/forget_password_controller.dart';
import 'package:takse/src/features/auth/controller/otp_controller.dart';
import 'package:takse/src/features/auth/controller/registration_controller.dart';
import 'package:takse/src/features/auth/screens/enter_your_mobile_screen.dart';
import 'package:takse/src/features/auth/screens/forget_password_screen.dart';
import 'package:takse/src/features/auth/screens/registration_screen.dart';
import 'package:takse/src/features/auth/screens/verify_otp_screen.dart';
import 'package:takse/src/features/home/controller/home_controller.dart';
import 'package:takse/src/features/manage_order/controller/manage_order_manage.dart';
import 'package:takse/src/features/manage_order/screen/manage_order_screen.dart';
import 'package:takse/src/features/notifications/controller/notification_controller.dart';
import 'package:takse/src/features/notifications/presentations/notification_screen.dart';
import 'package:takse/src/features/profile/controller/user_profile_controller.dart';
import 'package:takse/src/features/profile/screens/user_profile_screen.dart';
import 'package:takse/src/shared_widget/bottom_nav_bar.dart';

import '../../src/features/auth/screens/select_user_screen.dart';

class AppPages {
  static List<GetPage<dynamic>> getPageBindings() {
    return [
      GetPage(
        name: RouteConst.verifyNo,
        page: () => EnterYourMobileScreen(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.otpNo,
        page: () => const VerifyOtpScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => OtpController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.whoYouAre,
        page: () => const SelectUserTypeScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => RegistrationController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.registration,
        page: () => const RegistrationScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => RegistrationController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.forgetPassword,
        page: () => const ForgetPasswordScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => ForgetPasswordController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.homeScreen,
        page: () => const CommonBottomAppBar(),
        binding: BindingsBuilder(() => Get.lazyPut(() => HomeController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.userProfileScreen,
        page: () => const UserProfileScreen(showBackArrow: true),
        binding: BindingsBuilder(() => Get.lazyPut(() => UserProfileController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.manageOrder,
        page: () => const ManageOrderScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => ManageOrderController())),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RouteConst.notificationScreen,
        page: () => const NotificationScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => NotificationController())),
        transition: Transition.fadeIn,
      ),
    ];
  }
}
