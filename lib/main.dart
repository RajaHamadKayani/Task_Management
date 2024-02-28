import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/view_models/controllers/email_send_forget_password_controller/email_send_forget_password_controller.dart';
import 'package:task_management_system/view_models/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:task_management_system/view_models/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:task_management_system/view_models/controllers/splash_screen_controller/splash_screen_controller.dart';
import 'package:task_management_system/views/change_new_password/change_new_password.dart';
import 'package:task_management_system/views/email_send_forget_password/email_send_forget_password.dart';
import 'package:task_management_system/views/sign_in_screen/sign_in_screen.dart';
import 'package:task_management_system/views/sign_up_screen/sign_up_screen.dart';
import 'package:task_management_system/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:const  SplashScreen(),
    );
  }
}
