import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AssetImageWidget extends StatelessWidget {
  String? imagePath;
  BoxFit? boxFit;
  double? height;
  double? width;
  AssetImageWidget(
      {super.key, this.imagePath, this.boxFit, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath ?? "",
      fit: boxFit,
      height: height ?? 0.0,
      width: width ?? 0.0,
    );
  }
}
