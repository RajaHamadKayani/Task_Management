

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management_system/sign_up_controller/sign_up_controller.dart';
import 'package:task_management_system/splash_screen/splash_screen.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:task_management_system/widgets/asset_image_widget/asset_image_widget.dart';
import 'package:task_management_system/widgets/container_widget/container_widget.dart';
import 'package:task_management_system/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:task_management_system/widgets/text_widget/text_widget.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  Future<Uint8List?> galleryImagePicker() async {
  ImagePicker picker = ImagePicker();

  XFile? file = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 90,
  );

  if (file != null) return await file.readAsBytes(); // convert into Uint8List.
  return null;
}
   Uint8List? registrationImage;
  SignUpController signUpController = Get.put(SignUpController());
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  dialogFunction(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Are you sure want to delete Booking request?",
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height *
                0.3, // Set the height to half of the screen
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: ()async {
                    final Uint8List? image= await  galleryImagePicker();
                     if (image != null) {
                registrationImage = image;
                setState(() {});
              }
                      Navigator.pop(context);
                    },
                    child: ContainerWidget(
                      width: 100,
                      height: 40,
                      borderRadius: 12,
                      color: 0xFFFF0000,
                      widget: Center(
                        child: Text(
                          "Gallery",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickCameraImage();
                      Navigator.pop(context);
                    },
                    child: ContainerWidget(
                      width: 100,
                      height: 40,
                      borderRadius: 12,
                      color: 0xff0C3C43,
                      widget: Center(
                        child: Text(
                          "Camera",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  XFile? _image;

  Future<void> _pickGalleryImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _pickCameraImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

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
                      builder: (context) => const SplashScreen()));
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
                title: "SignUp",
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    dialogFunction(context);
                  },
                  child: Container(
                      height: !ResponsiveLayout.isMobile(context) ? 70 : 100,
                      width: !ResponsiveLayout.isMobile(context) ? 70 : 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffCDD1B8),
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: _image == null
                            ? Center(
                                child: Text(
                                'Select Image',
                                style: AppStyles.regularTextStyle(
                                    fontSize:
                                        !ResponsiveLayout.isMobile(context)
                                            ? 16
                                            : 12,
                                    color: Colors.black),
                              ))
                            : Image.memory(registrationImage!,
                            fit: BoxFit.cover,)
                      )
                      ),
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
                  leadingIcon: Icons.person,
                  controller: controllerFirstName,
                  hintText: "First Name",
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
                  leadingIcon: Icons.phone,
                  controller: controllerPhone,
                  hintText: "Phone Number",
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
                  leadingIcon: Icons.location_city,
                  controller: controllerAddress,
                  hintText: "Enter Address",
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
                  signUpController.signUpMethod(
                      context,
                      controllerMail.value.text,
                      controllerPassword.value.text,
                      controllerFirstName.value.text,
                      controllerPhone.value.text,
                      controllerAddress.value.text,
                      _image?.path ?? "");
                },
                child: ContainerWidget(
                  height: !ResponsiveLayout.isMobile(context) ? 60 : 40,
                  width: double.infinity,
                  borderRadius: 30,
                  color: 0xff00CEC9,
                  widget: Center(
                    child: TextWidget(
                      title: "Sign Up",
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
