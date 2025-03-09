import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void onSignUpPressed() {
    Get.toNamed('/signup');
  }

  void onLogInPressed() {
    Get.toNamed('/login');
  }
}
