
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_system/email_send_forget_password_controller/email_send_forget_password_controller.dart';
import 'package:task_management_system/login_view/login_view.dart';
import 'package:task_management_system/routing_services/routing_services.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/widgets/text_widget/text_widget.dart';


class EmailSendForgetPassword extends StatefulWidget {
  const EmailSendForgetPassword({super.key});

  @override
  State<EmailSendForgetPassword> createState() =>
      _EmailSendForgetPasswordState();
}

class _EmailSendForgetPasswordState extends State<EmailSendForgetPassword> {
  RoutingServices routingServices = Get.put(RoutingServices());
  static TextEditingController emailController = TextEditingController();
  EmailSendForgetPasswordController emailSendForgetPasswordController =
      Get.put(EmailSendForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 64),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              const SizedBox(
                height: 20,
              ),
              // Center(
              //   child: Stack(
              //     alignment: Alignment.center,
              //     children: [
              //       SvgPicture.asset("assets/svgs/forget_password_bg_logo.svg"),
              //       Image.asset("assets/images/forget_password_fg_logo.png")
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 33, left: 24, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      title: "Forget Password",
                      style: AppStyles.boldTextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff374151),
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextWidget(
                      title: "Enter your registered email below",
                      style: AppStyles.regularTextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff9CA3AF),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 71,
                    ),
                    TextWidget(
                      title: "Email Address",
                      style: AppStyles.regularTextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff9CA3AF),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ContainerWidget(
                      height: 50,
                      width: double.infinity,
                      borderColor: 0xffBEC5D1,
                      borderRadius: 12,
                      widget: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextFormFieldWidget(
                          leadingIcon: Icons.email,
                          hintText: "Enter your email",
                          hintTextStyle: AppStyles.regularTextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff374151)),
                          controller: emailController,
                          controllerStyle: AppStyles.regularTextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff374151)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Remember the password? ",
                            style: AppStyles.regularTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff9CA3AF))),
                        TextSpan(
                            text: "Sign in",
                            style: AppStyles.regularTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppStyles.tealColor))
                      ])),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          emailSendForgetPasswordController
                              .sendEmailResetPassword(
                                  emailController.value.text, context);
                        },
                        child: ContainerWidget(
                          borderRadius: 12,
                          color: 0xff009688,
                          height: 50,
                          width: 200,
                          widget: Center(
                            child: TextWidget(
                              title: "Submit",
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
