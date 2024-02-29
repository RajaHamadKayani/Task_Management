import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChnageNewPasswordController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> changeNewPassword(String url, String newPassword) async {
    String uid = firebaseAuth.currentUser!.uid;
    try {
      await firebaseAuth.confirmPasswordReset(
          code: url, newPassword: newPassword);

      Get.snackbar(
        "Password Reset",
        "Password reset successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.teal,
        colorText: Colors.orange,
      );
      firebaseFirestore
          .collection("users")
          .doc(uid)
          .update({"password": newPassword});
    } catch (e) {
      Get.snackbar(
        "Password Reset",
        "Something went wrong: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.teal,
        colorText: Colors.orange,
      );
      print(e.toString());
    }
  }
}
