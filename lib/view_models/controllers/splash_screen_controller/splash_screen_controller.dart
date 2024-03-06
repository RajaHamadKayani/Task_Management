import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/services/routing_services/routing_services.dart';
import 'package:task_management_system/views/signup_view/signu_viw.dart';

RoutingServices routingServices = Get.put(RoutingServices());

class SplashController extends GetxController {
  void goToNext(BuildContext context) async {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignUpView()));
    });
  }
}
