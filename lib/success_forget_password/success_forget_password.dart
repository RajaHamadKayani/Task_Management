
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_management_system/change_new_password/change_new_password.dart';
import 'package:task_management_system/email_send_forget_password/email_send_forget_password.dart';
import 'package:task_management_system/email_send_forget_password_controller/email_send_forget_password_controller.dart';
import 'package:task_management_system/user_profile_data/user_profile_data.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/widgets/text_widget/text_widget.dart';


class SuccessForgetPassword extends StatefulWidget {
  const SuccessForgetPassword({super.key});

  @override
  State<SuccessForgetPassword> createState() => _SuccessForgetPasswordState();
}

class _SuccessForgetPasswordState extends State<SuccessForgetPassword> {
  @override
  void initState() {
    super.initState();
    UserDataService.initUserData();
    if (kDebugMode) {
      print("Email of the registered user: ${UserDataService.userEmail}");
    }
  }

  EmailSendForgetPasswordController emailSendForgetPasswordController =
      Get.put(EmailSendForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailSendForgetPassword()));
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 47),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/success_forget_password.svg"),
                    Image.asset("assets/images/relaxed_forget_password.png")
                  ],
                ),
                const SizedBox(
                  height: 65,
                ),
                TextWidget(
                  title: "Success",
                  style: AppStyles.boldTextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff374151)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  title: "Please check your email to create",
                  style: AppStyles.regularTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color(0xff6B7280)),
                ),
                TextWidget(
                  title: "a new password",
                  style: AppStyles.regularTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color(0xff6B7280)),
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: () {
                    emailSendForgetPasswordController.sendEmailResetPassword(
                        UserDataService.userEmail!, context);
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Cant get an email? ",
                        style: AppStyles.regularTextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: const Color(0xff6B7280))),
                    TextSpan(
                        text: "Resubmit",
                        style: AppStyles.regularTextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.teal))
                  ])),
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangeNewPassword()));
                  },
                  child: ContainerWidget(
                    height: 50,
                    width: 200,
                    borderRadius: 12,
                    color: 0xff009688,
                    widget: Center(
                      child: TextWidget(
                        title: "Reset Password",
                        style: AppStyles.boldTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
