import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  TextStyle? hintTextStyle;
  TextStyle? controllerStyle;
  IconData? leadingIcon;
  IconData? suffixIcon;
  String? lableText;
  TextStyle ? labelStyl;
  TextFormFieldWidget(
      {super.key,
      this.controller,
      this.controllerStyle,
      this.hintText,
      this.hintTextStyle,
      this.lableText,
      this.leadingIcon,
      this.labelStyl,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: controllerStyle,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(leadingIcon),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        hintStyle: hintTextStyle,
        label: Text(lableText ?? ""),
        labelStyle: labelStyl
      ),
    );
  }
}
