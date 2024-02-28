import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const Color tealColor = Color(0xff009688);
    static const Color orangeColor = Color(0xffff9800);

  static TextStyle regularTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16.0,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle boldTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16.0,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle blueTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16.0,
      color: Colors.blue,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
