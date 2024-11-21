import 'package:get/get.dart';
import 'package:takse/src/features/auth/model/user_type_entity.dart';

class RegistrationController extends GetxController {
  UserTypeEntity? userType;

  void selectUser(UserTypeEntity type) {
    userType = type;
    update(['registration-first']);
  }
}
