import 'package:get/instance_manager.dart';
import 'package:takse/src/features/home/controller/see_more_controller.dart';

class SeeMoreServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeeMoreServiceController());
  }
}
