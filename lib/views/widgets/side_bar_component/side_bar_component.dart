import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/view_models/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:task_management_system/view_models/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:task_management_system/views/widgets/reuable_list_tile/reusable_list_tile.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

SignInController signInController = Get.put(SignInController());
SignUpController signUpController = Get.put(SignUpController());

class SideBarComponent extends StatelessWidget {
  const SideBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 99, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        title: signInController.name,
                        style: AppStyles.boldTextStyle(
                            color: Colors.black,
                            fontSize:
                                !ResponsiveLayout.isMobile(context) ? 25 : 15,
                            fontWeight: FontWeight.bold),
                      ),
                      TextWidget(
                        title: signInController.phone,
                        style: AppStyles.boldTextStyle(
                            color: Colors.black,
                            fontSize:
                                !ResponsiveLayout.isMobile(context) ? 20 : 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/profile_icon.png"),
                  )
                ],
              ),
              const SizedBox(
                height: 83,
              ),
              Expanded(child: ReusableListTile())
            ],
          ),
        ),
      ),
    );
  }
}
