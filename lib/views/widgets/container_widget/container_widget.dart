import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerWidget extends StatelessWidget {
  double? height;
  double? width;
  int? color;
  double? borderRadius;
  double? borderWidth;
  int? borderColor;
  Widget? widget;
  ContainerWidget(
      {super.key,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.color,
      this.widget,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: height ?? 0.0,
      width: width ?? 0.0,
      decoration: BoxDecoration(
          color: Color(color ?? 0),
          borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
          border: Border.all(
              color: Color(borderColor ?? 0), width: borderWidth ?? 0)),
              child: widget ?? Container(),
    );
  }
}
