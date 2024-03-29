
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/home_screen/home_screen.dart';
import 'package:task_management_system/sharedPreferences_helper/sharedPreferences_helper.dart';

class SignInController extends GetxController {
  User? user;
  String email = '';
  String phone = '';
  String name = '';
  String address = '';
  String uid = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signInMethod(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
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
     
      user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        uid = user!.uid;

        try {
          DocumentSnapshot<Map<String, dynamic>> userSnapshot =
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
                  .get();

          if (userSnapshot.exists) {
            // User data found
            Map<String, dynamic> userData = userSnapshot.data()!;

            // Now you can access individual fields from userData
            email = userData['email'];
            name = userData['name'];
            address = userData['address'];
            phone = userData['phone'];
             if (user != null) {
        String userName =name;
        await SharedPreferencesHelper.storeName(userName);
        await SharedPreferencesHelper.storeEmail(email);
        await SharedPreferencesHelper.storePhone(phone);
        await SharedPreferencesHelper.storeAddress(address);
      }

            // Print or use the retrieved data as needed
            print('Email: $email');
            print('Name: $name');
            print('Address: $address');
            print('Phone: $phone');
          } else {
            // User data not found
            print('User data not found in Firestore.');
          }
        } catch (e) {
          print('Error fetching user data: $e');
        }
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email",
            backgroundColor: Colors.teal,
            colorText: Colors.orange,
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided",
            backgroundColor: Colors.teal,
            colorText: Colors.orange,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error during login: $e");
      Get.snackbar("Error", "An unexpected error occurred",
          backgroundColor: Colors.teal,
          colorText: Colors.orange,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
