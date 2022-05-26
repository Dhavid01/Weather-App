import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/utils/color.dart';

TextStyle heading = GoogleFonts.poppins(
    fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white);

TextStyle caption = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.grey,
);

TextStyle headingMeduim = GoogleFonts.poppins(
    fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white);

TextStyle captionMedium = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey);

TextStyle headingRegular = GoogleFonts.poppins(
    fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white);

TextStyle superScript = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontSize: 25,
    fontFeatures: [const FontFeature.enable('sups')]);

TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 20, fontWeight: FontWeight.w600, color: kLightestColor);
