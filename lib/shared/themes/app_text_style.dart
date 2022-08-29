import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_byte/shared/themes/app_colors.dart';

class AppTextStyle {
  static final headerTitle =
      GoogleFonts.lato(color: AppColors.bege, fontSize: 22);
  static final footerDescription =
      GoogleFonts.lato(fontSize: 16, color: AppColors.bege);
  static final sliderValue =
      GoogleFonts.lato(fontSize: 32, fontWeight: FontWeight.w400);
  static final fm = GoogleFonts.lato(fontSize: 32, color: AppColors.black);
}
