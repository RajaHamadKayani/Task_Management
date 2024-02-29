import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/view_models/controllers/change_new_password/change_new_password.dart';
import 'package:task_management_system/views/success_forget_password/success_forget_password.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({super.key});

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  ChnageNewPasswordController chnageNewPasswordController =
      Get.put(ChnageNewPasswordController());
  TextEditingController controllerUrl = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();

  TextEditingController controllerConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 117, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               IconButton(onPressed: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SuccessForgetPassword()));
               }, icon:const  Icon(Icons.arrow_back)),
            const SizedBox(height: 20,),
              TextWidget(
                title: "Change New Password",
                style: AppStyles.boldTextStyle(
                    color: const Color(0xff374151),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                title: "Paste the Sent URL to your gmail in the first field",
                style: AppStyles.boldTextStyle(
                    color: const Color(0xff828282),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 56,
              ),
              TextWidget(
                title: "Enter URL",
                style: AppStyles.boldTextStyle(
                    color: const Color(0xff9CA3AF),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              ContainerWidget(
                borderColor: 0xff374151,
                borderWidth: 1,
                borderRadius: 12,
                height: 50,
                width: double.infinity,
                widget: TextFormFieldWidget(
                  controller: controllerUrl,
                  leadingIcon: Icons.link,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                title: "Enter New Password",
                style: AppStyles.boldTextStyle(
                    color: const Color(0xff9CA3AF),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              ContainerWidget(
                borderColor: 0xff374151,
                borderWidth: 1,
                borderRadius: 12,
                height: 50,
                width: double.infinity,
                widget: TextFormFieldWidget(
                  controller: controllerNewPassword,
                  leadingIcon: Icons.password,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                title: "Confirm Password",
                style: AppStyles.boldTextStyle(
                    color: const Color(0xff9CA3AF),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              ContainerWidget(
                borderColor: 0xff374151,
                borderWidth: 1,
                borderRadius: 12,
                height: 50,
                width: double.infinity,
                widget: TextFormFieldWidget(
                  controller: controllerConfirmPassword,
                  leadingIcon: Icons.password,
                ),
              ),
              const SizedBox(
                height: 41,
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
                height: 41,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    chnageNewPasswordController.changeNewPassword(
                        controllerUrl.value.text,
                        controllerNewPassword.value.text);
                  },
                  child: ContainerWidget(
                    borderRadius: 12,
                    color: 0xff009688,
                    height: 50,
                    width: 200,
                    widget: Center(
                      child: TextWidget(
                        title: "Reset Password",
                        style: AppStyles.boldTextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
