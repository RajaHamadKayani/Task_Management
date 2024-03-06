import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/view_models/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:task_management_system/views/launcher_page/launcher_page.dart';
import 'package:task_management_system/views/signup_view/signu_viw.dart';
import 'package:task_management_system/views/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/views/widgets/asset_image_widget/asset_image_widget.dart';
import 'package:task_management_system/views/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/views/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  SignInController signInController = Get.put(SignInController());
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffC0C0C0),
      appBar: AppBarWdiget(
        leadingIcon: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LauncherPage()));
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 33),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                title: "Login",
                style: AppStyles.boldTextStyle(
                    color: Colors.black,
                    fontSize: !ResponsiveLayout.isMobile(context) ? 40 : 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 31,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ContainerWidget(
                      height: !ResponsiveLayout.isMobile(context) ? 70 : 50,
                      borderRadius: 30,
                      color: 0xffffffff,
                      widget: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            ContainerWidget(
                              height:
                                  !ResponsiveLayout.isMobile(context) ? 50 : 33,
                              width:
                                  !ResponsiveLayout.isMobile(context) ? 50 : 33,
                              widget: AssetImageWidget(
                                imagePath: "assets/images/google_logo.png",
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              title: "Google",
                              style: AppStyles.boldTextStyle(
                                  color: Colors.black,
                                  fontSize: !ResponsiveLayout.isMobile(context)
                                      ? 20
                                      : 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: ContainerWidget(
                      height: !ResponsiveLayout.isMobile(context) ? 70 : 50,
                      borderRadius: 30,
                      color: 0xff3498DB,
                      widget: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            ContainerWidget(
                              height:
                                  !ResponsiveLayout.isMobile(context) ? 50 : 33,
                              width:
                                  !ResponsiveLayout.isMobile(context) ? 50 : 33,
                              widget: AssetImageWidget(
                                imagePath: "assets/images/fb_logo.png",
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              title: "Facebook",
                              style: AppStyles.boldTextStyle(
                                  color: Colors.white,
                                  fontSize: !ResponsiveLayout.isMobile(context)
                                      ? 20
                                      : 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              Center(
                child: TextWidget(
                  title: "or sign in with",
                  style: AppStyles.regularTextStyle(
                      color: Colors.black,
                      fontSize: !ResponsiveLayout.isMobile(context) ? 16 : 12,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              ContainerWidget(
                height: !ResponsiveLayout.isMobile(context) ? 70 : 50,
                width: double.infinity,
                borderRadius: 30,
                color: 0xffffffff,
                widget: TextFormFieldWidget(
                  leadingIcon: Icons.email,
                  controller: controllerMail,
                  hintText: "Email",
                  controllerStyle: AppStyles.regularTextStyle(
                      fontSize: !ResponsiveLayout.isMobile(context) ? 20 : 12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ContainerWidget(
                height: !ResponsiveLayout.isMobile(context) ? 70 : 50,
                width: double.infinity,
                borderRadius: 30,
                color: 0xffffffff,
                widget: TextFormFieldWidget(
                  suffixIcon: Icons.visibility,
                  leadingIcon: Icons.password,
                  controller: controllerPassword,
                  hintText: "Password",
                  controllerStyle: AppStyles.regularTextStyle(
                      fontSize: !ResponsiveLayout.isMobile(context) ? 20 : 12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextWidget(
                  title: "Forgot your password?",
                  style: AppStyles.regularTextStyle(
                      fontSize: !ResponsiveLayout.isMobile(context) ? 18 : 12,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              GestureDetector(
                onTap: () {
                  signInController.signInMethod(context,
                      controllerMail.value.text, controllerPassword.value.text);
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
                          fontSize:
                              !ResponsiveLayout.isMobile(context) ? 22 : 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Dont have an account? ",
                        style: AppStyles.regularTextStyle(
                            color: Colors.black,
                            fontSize:
                                !ResponsiveLayout.isMobile(context) ? 18 : 12,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "Register Now",
                        style: AppStyles.regularTextStyle(
                            color: Colors.blue,
                            fontSize:
                                !ResponsiveLayout.isMobile(context) ? 18 : 12,
                            fontWeight: FontWeight.w500))
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
