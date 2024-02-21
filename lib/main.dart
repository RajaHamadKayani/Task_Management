import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/services/routing_services/routing_services.dart';
import 'package:task_management_system/views/sign_in_screen/sign_in_screen.dart';
import 'package:task_management_system/views/sign_up_screen/sign_up_screen.dart';
import 'package:task_management_system/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/signin', page: () => const SignInScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
      ],
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => RoutingServices());
      }),
    );
  }
}
