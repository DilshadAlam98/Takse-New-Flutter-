import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeBottomTab(int index) {
    selectedIndex.value = index;
  }
}
