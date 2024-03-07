// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PhoneNumberController extends GetxController {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   phoneAuthMethod(String phoneNumbr) async {
//     try {
//        firebaseAuth.verifyPhoneNumber(
//         timeout: const Duration(seconds: 60),
//         phoneNumber: phoneNumbr,
//         verificationCompleted: (PhoneAuthCredential credentials) async {
//           await firebaseAuth.signInWithPhoneNumber(credentials.toString());
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           if (e.code == "invaid-phone-number") {
//             Get.snackbar("Phone Number Auth", "Failed Invalid Phone Number!!!",
//                 snackPosition: SnackPosition.BOTTOM,
//                 backgroundColor: Colors.teal,
//                 colorText: Colors.white);
//             if (kDebugMode) {
//               print("'Invalid Phone Number");
//             }
//           }
//         },
//         codeSent: (String verficationId, int? resendToken) async {
//           String smsCode = "xxxx";
//           PhoneAuthCredential credential = PhoneAuthProvider.credential(
//               verificationId: verficationId, smsCode: smsCode);
//         },
//         codeAutoRetrievalTimeout: (String verficationId) {});
//     ConfirmationResult confirmationResult =
//         await firebaseAuth.signInWithPhoneNumber(
//             phoneNumbr,
//             RecaptchaVerifier(
//                 onExpired: () {
//                   Get.snackbar("Recaptcha Verfication", "Recaptcha Expired!!!",
//                       colorText: Colors.white,
//                       backgroundColor: Colors.teal,
//                       snackPosition: SnackPosition.BOTTOM);
//                 },
//                 onError: (FirebaseAuthException e) => Get.snackbar(
//                     "Recaptcha Verification", "Failed!!!",
//                     colorText: Colors.white,
//                     backgroundColor: Colors.teal,
//                     snackPosition: SnackPosition.BOTTOM),
//                 onSuccess: () {
//                   Get.snackbar(
//                       "Recaptcha Verification", "Verified Successfully!!!",
//                       snackPosition: SnackPosition.BOTTOM,
//                       colorText: Colors.white,
//                       backgroundColor: Colors.teal);
//                 },
//                 auth: firebaseAuth,
//                 theme: RecaptchaVerifierTheme.dark,
//                 size: RecaptchaVerifierSize.normal,
//                 container: "recapcha"));
//     UserCredential userCredential = await confirmationResult.confirm("12345");
//     } catch (e) {
//         Get.snackbar("Phone Number Auth", "Failed Invalid Phone Number!!!",
//                 snackPosition: SnackPosition.BOTTOM,
//                 backgroundColor: Colors.teal,
//                 colorText: Colors.white);
//             if (kDebugMode) {
//               print("'Invalid Phone Number");
//             }
//     }
//   }
// }
