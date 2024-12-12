import 'package:get/get.dart';
import 'package:takse/core/routes/route_const.dart';
import 'package:takse/src/features/auth/controller/otp_controller.dart';
import 'package:takse/src/features/auth/controller/registration_controller.dart';
import 'package:takse/src/features/auth/screens/enter_your_mobile_screen.dart';
import 'package:takse/src/features/auth/screens/registration_screen.dart';
import 'package:takse/src/features/auth/screens/verify_otp_screen.dart';

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
        page: () => const Registration(),
        binding: BindingsBuilder(() => Get.lazyPut(() => RegistrationController())),
        transition: Transition.fadeIn,
      ),
    ];
  }
}
