import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/view_models/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:task_management_system/view_models/controllers/splash_screen_controller/splash_screen_controller.dart';
import 'package:task_management_system/views/sign_in_screen/sign_in_screen.dart';
import 'package:task_management_system/views/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWdiget(
        leadingIcon: Icons.menu,
        titl: "Task Management System",
        textStyle: AppStyles.boldTextStyle(
          color: Colors.orange,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                title: "Register YourSelf",
                style:
                    AppStyles.boldTextStyle(color: Colors.teal, fontSize: 20),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffff9800,
                      borderRadius: 20,
                      borderWidth: 2,
                      widget: TextFormFieldWidget(
                        hintText: "Enter your email",
                        hintTextStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        controller: emailController,
                        leadingIcon: Icons.email,
                        controllerStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffff9800,
                      borderRadius: 20,
                      borderWidth: 2,
                      widget: TextFormFieldWidget(
                        hintText: "Enter your name",
                        hintTextStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        controller: nameController,
                        leadingIcon: Icons.person,
                        controllerStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffff9800,
                      borderRadius: 20,
                      borderWidth: 2,
                      widget: TextFormFieldWidget(
                        hintText: "Enter your password",
                        hintTextStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        controller: passwordController,
                        leadingIcon: Icons.password,
                        controllerStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffff9800,
                      borderRadius: 20,
                      borderWidth: 2,
                      widget: TextFormFieldWidget(
                        hintText: "Confirm Password",
                        hintTextStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        controller: confirmPasswordController,
                        leadingIcon: Icons.password,
                        controllerStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffff9800,
                      borderRadius: 20,
                      borderWidth: 2,
                      widget: TextFormFieldWidget(
                        hintText: "Enter your phone number",
                        hintTextStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        controller: phoneController,
                        leadingIcon: Icons.password,
                        controllerStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffff9800,
                      borderRadius: 20,
                      borderWidth: 2,
                      widget: TextFormFieldWidget(
                        hintText: "Enter your address",
                        hintTextStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        controller: addressController,
                        leadingIcon: Icons.password,
                        controllerStyle: AppStyles.regularTextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        signUpController.signUpMethod(
                            context,
                            emailController.value.text,
                            passwordController.value.text,
                            nameController.value.text,
                            phoneController.value.text,
                            addressController.value.text);
                      },
                      child: ContainerWidget(
                        height: 60,
                        width: 250,
                        color: 0xff009688,
                        borderRadius: 50,
                        widget: Center(
                          child: TextWidget(
                            title: "Sign Up",
                            style: AppStyles.boldTextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Have an account ? ",
                            style: AppStyles.regularTextStyle(
                                color: Colors.teal, fontSize: 14)),
                        TextSpan(
                            text: "Sign In",
                            style: AppStyles.regularTextStyle(
                                color: Colors.orange, fontSize: 14))
                      ])),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
