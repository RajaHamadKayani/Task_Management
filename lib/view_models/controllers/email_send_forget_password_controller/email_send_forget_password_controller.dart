import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/views/success_forget_password/success_forget_password.dart';

class EmailSendForgetPasswordController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void sendEmailResetPassword(String email, BuildContext context) async {
    try {
      firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar("Password Reset", "Code sent to your gmail successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.teal,
          colorText: Colors.orange);
           Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SuccessForgetPassword()));
    } catch (e) {
      Get.snackbar("Password Reset", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.teal,
          colorText: Colors.orange);
    }
  }
}
