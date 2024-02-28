import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/services/routing_services/routing_services.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/view_models/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:task_management_system/views/email_send_forget_password/email_send_forget_password.dart';
import 'package:task_management_system/views/sign_up_screen/sign_up_screen.dart';
import 'package:task_management_system/views/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInController signInController = Get.put(SignInController());
  RoutingServices routingServices = Get.put(RoutingServices());
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: "Sign In",
              style: AppStyles.boldTextStyle(color: Colors.teal, fontSize: 20),
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
                    height: 40,
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
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      signInController.signInMethod(
                          context,
                          emailController.value.text,
                          passwordController.value.text);
                    },
                    child: ContainerWidget(
                      height: 60,
                      width: 250,
                      color: 0xff009688,
                      borderRadius: 50,
                      widget: Center(
                        child: TextWidget(
                          title: "Sign In",
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
                              builder: (context) => const SignUpScreen()));
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Do not have an account ? ",
                          style: AppStyles.regularTextStyle(
                              color: Colors.teal, fontSize: 14)),
                      TextSpan(
                          text: "Sign Up",
                          style: AppStyles.regularTextStyle(
                              color: Colors.orange, fontSize: 14))
                    ])),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EmailSendForgetPassword()));
                    },
                    child: TextWidget(
                      title: "Forget Password?",
                      style: AppStyles.boldTextStyle(
                          color: Colors.teal, fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
