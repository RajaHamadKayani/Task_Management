import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChnageNewPasswordController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void changeNewPassword(String url, String newPassword) async {
    try {
      firebaseAuth.confirmPasswordReset(code: url, newPassword: newPassword);
      Get.snackbar("Password Reset", "Password Reset successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.teal,
          colorText: Colors.orange);
    } catch (e) {
      Get.snackbar("Password Reset", "Something went wrong ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.teal,
          colorText: Colors.orange);
    }
  }
}
