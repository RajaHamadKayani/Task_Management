
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:task_management_system/login_view/login_view.dart';


class SignUpController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void signUpMethod(BuildContext context, String email, String password,
      String name, String phone, String address, String photo) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Registration successful
      print("User registered successfully: ${userCredential.user?.email}");
      Get.snackbar("Success", "User registered successfully",
          backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginView()));
      await firebaseFirestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'email': email,
        'name': name,
        'phone': phone,
        'address': address,
        "password": password,
        "photo":photo
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "The password provided is too weak",
            backgroundColor: Colors.teal,
            colorText: Colors.orange,
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email",
            backgroundColor: Colors.teal,
            colorText: Colors.orange,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar("Error", "An unexpected error occurred",
          backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  
}
