import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/view_models/controllers/splash_screen_controller/splash_screen_controller.dart';
import 'package:task_management_system/views/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/views/widgets/asset_image_widget/asset_image_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());
  @override
  void initState() {
    super.initState();
    splashController.goToNext(context);
    if (kDebugMode) {
      print("It is splah screen!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWdiget(
        titl: "Task Management System",
        textStyle: AppStyles.boldTextStyle(
            color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AssetImageWidget(
              imagePath: "assets/images/splash_logo.png",
              boxFit: BoxFit.cover,
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            TextWidget(
              title: "Task Management System",
              style: AppStyles.regularTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.teal),
            )
          ],
        ),
      ),
    );
  }
}
