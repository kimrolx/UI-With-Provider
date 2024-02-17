import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_with_provider/src/constants/colors.dart';
import '../models/onboarding_model.dart';

Widget buildOnboardingPage(OnboardingModel page, double width, double height) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: height * 0.01,
      horizontal: width * 0.05,
    ),
    child: Column(
      children: [
        Text(
          page.title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: width * 0.065,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gap(height * 0.01),
        Text(
          page.description,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: width * 0.043,
            fontWeight: FontWeight.w400,
            color: grayFont,
          ),
        ),
      ],
    ),
  );
}
