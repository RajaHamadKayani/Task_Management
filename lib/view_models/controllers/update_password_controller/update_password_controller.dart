import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_management_system/views/login_view/login_view.dart';

class UpdatePasswordController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> changePassword(String newPassword) async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user != null) {
        await user.updatePassword(newPassword);

        Get.snackbar(
          "Success",
          "Password changed successfully",
          backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.to(const LoginView());
      } else {
        Get.snackbar(
          "Error",
          "User not signed in",
          backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to change password: $e",
        backgroundColor: Colors.teal,
        colorText: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
