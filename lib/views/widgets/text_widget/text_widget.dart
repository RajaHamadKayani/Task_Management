import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  String? title;

  TextStyle? style;
  TextWidget({super.key, this.style, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: style ?? null,
    );
  }
}
