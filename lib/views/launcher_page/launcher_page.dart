import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/views/login_view/login_view.dart';
import 'package:task_management_system/views/signup_view/signu_viw.dart';
import 'package:task_management_system/views/splash_view/splash_view.dart';
import 'package:task_management_system/views/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/views/widgets/asset_image_widget/asset_image_widget.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';


class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWdiget(
        leadingIcon: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SplashView()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        titl: "Travel Guide",
        textStyle: AppStyles.boldTextStyle(
          fontWeight: FontWeight.bold,
          fontSize: !ResponsiveLayout.isMobile(context) ? 25 : 20,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerWidget(
                  height: !ResponsiveLayout.isMobile(context) ? 400 : 250,
                  width: !ResponsiveLayout.isMobile(context) ? 400 : 250,
                  widget: AssetImageWidget(
                    height: double.infinity,
                    width: double.infinity,
                    boxFit: BoxFit.cover,
                    imagePath: "assets/images/travel.jpg",
                  ),
                ),
                const SizedBox(
                  height: 113,
                ),
                TextWidget(
                  title: "Plan your Trip",
                  style: AppStyles.boldTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: !ResponsiveLayout.isMobile(context) ? 30 : 22,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 33,
                ),
                TextWidget(
                  title: "Custom and fast planning\nwith a low price",
                  style: AppStyles.regularTextStyle(
                      fontSize: !ResponsiveLayout.isMobile(context) ? 20 : 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 97),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                        },
                        child: ContainerWidget(
                          height: !ResponsiveLayout.isMobile(context) ? 60 : 40,
                          width: double.infinity,
                          borderRadius: 30,
                          color: 0xff00CEC9,
                          widget: Center(
                            child: TextWidget(
                              title: "Login",
                              style: AppStyles.boldTextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: !ResponsiveLayout.isMobile(context)
                                      ? 22
                                      : 16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        },
                        child: ContainerWidget(
                          borderColor: 0xff000000,
                          height: !ResponsiveLayout.isMobile(context) ? 60 : 40,
                          width: double.infinity,
                          borderRadius: 30,
                          color: 0xffffffff,
                          widget: Center(
                            child: TextWidget(
                              title: "Create Account",
                              style: AppStyles.boldTextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: !ResponsiveLayout.isMobile(context)
                                      ? 22
                                      : 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
