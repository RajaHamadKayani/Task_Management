import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/view_models/controllers/update_password_controller/update_password_controller.dart';
import 'package:task_management_system/views/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/drawer_widget/drawer_widget.dart';
import 'package:task_management_system/views/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  UpdatePasswordController updatePasswordController =
      Get.put(UpdatePasswordController());
  TextEditingController newPassword = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffC0C0C0),
      key: scaffoldKey,
      appBar: AppBarWdiget(
        titl: "Mazlume Karbala",
        leadingIcon: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        textStyle: AppStyles.boldTextStyle(color: Colors.black),
      ),
      drawer: !ResponsiveLayout.isDesktop(context) &&
              !ResponsiveLayout.isTablet(context)
          ? const MyDrawerWidget()
          : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                title: "Change Password",
                style: AppStyles.boldTextStyle(
                    color: Colors.black,
                    fontSize: !ResponsiveLayout.isMobile(context) ? 25 : 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/change_new_password_bg.png"),
                    Image.asset("assets/images/change_new_password_fg.png"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ContainerWidget(
                  height: !ResponsiveLayout.isMobile(context) ? 70 : 50,
                  width: double.infinity,
                  borderRadius: 25,
                  color: 0xffffffff,
                  widget: TextFormFieldWidget(
                    controller: newPassword,
                    leadingIcon: Icons.password,
                    hintText: "Enter new Password",
                    hintTextStyle: AppStyles.boldTextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  updatePasswordController
                      .changePassword(newPassword.value.text);
                },
                child: ContainerWidget(
                  height: !ResponsiveLayout.isMobile(context) ? 60 : 40,
                  width: !ResponsiveLayout.isMobile(context) ? 400 : 200,
                  borderRadius: 30,
                  color: 0xff00CEC9,
                  widget: Center(
                    child: TextWidget(
                      title: "Change Password",
                      style: AppStyles.boldTextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              !ResponsiveLayout.isMobile(context) ? 22 : 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
