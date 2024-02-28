import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signInMethod(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User logged in successfully: ${userCredential.user?.email}");
      Get.snackbar(
        "Success",
        "User logged in successfully",
        backgroundColor: Colors.teal,
        colorText: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email",
 backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Wrong password provided",
         backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM
        );
      }
    } catch (e) {
      print("Error during login: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred",
       backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }
}
