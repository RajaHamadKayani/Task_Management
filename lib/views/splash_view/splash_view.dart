import 'package:flutter/material.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/views/launcher_page/launcher_page.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: ResponsiveLayout.isDesktop(context)
                ? 400
                : ResponsiveLayout.isTablet(context)
                    ? 300
                    : 250,
            width: ResponsiveLayout.isDesktop(context)
                ? 400
                : ResponsiveLayout.isTablet(context)
                    ? 300
                    : 250,
            child: Image.asset("assets/images/travel.jpg"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            title: 'Mazlume karbala',
            style: AppStyles.boldTextStyle(
                color: Colors.black,
                fontSize: !ResponsiveLayout.isMobile(context) ? 30 : 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextWidget(
            title: "Welcome to Mazlume karbala Guide",
            style: AppStyles.regularTextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: !ResponsiveLayout.isMobile(context) ? 16 : 12),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LauncherPage()));
              },
              child: ContainerWidget(
                height: !ResponsiveLayout.isMobile(context) ? 60 : 40,
                width: double.infinity,
                borderRadius: 30,
                color: 0xff00CEC9,
                widget: Center(
                  child: TextWidget(
                    title: "Let's Start",
                    style: AppStyles.boldTextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            !ResponsiveLayout.isMobile(context) ? 22 : 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
