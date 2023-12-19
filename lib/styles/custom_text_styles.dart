import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomTextStyles {
  static TextStyle largeTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 36,
    height: 43 / 36,
  );

  static TextStyle title1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 34 / 28,
  );

  static TextStyle title2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
  );

  static TextStyle title3 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 24 / 20,
  );

  static TextStyle headline = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    height: 22 / 17,
  );

  static TextStyle subheadline = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    height: 20 / 15,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 22 / 17,
  );

  static TextStyle body2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 22 / 15,
  );

  static TextStyle callout = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 20 / 16,
  );
  static TextStyle caption1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 28 / 18,
  );

  static TextStyle caption2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 16 / 14,
  );

  static TextStyle footnote = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 18 / 13,
  );
}
