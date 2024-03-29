// auth_controller.dart

import 'package:get/get.dart';

class RoutingServices extends GetxController {
  // Your authentication-related logic goes here

  void goToSignIn() {
    Get.toNamed('/signin');
  }

  void goToSignUp() {
    Get.toNamed('/signup');
  }

  void goToSplash() {
    Get.toNamed('/splash');
  }
   void goToEmailSendForgetPassword() {
    Get.toNamed('/emailSendForgetPassword');
  }
}
