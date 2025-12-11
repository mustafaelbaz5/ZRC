import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

class AppTextStyles {
  // Black
  static TextStyle font32BlackBold() => GoogleFonts.tajawal(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font20BlackBold() =>
      GoogleFonts.tajawal(fontSize: 20.sp, fontWeight: FontWeightHelper.bold);

  static TextStyle font16BlackBold() =>
      GoogleFonts.tajawal(fontSize: 16.sp, fontWeight: FontWeightHelper.bold);

  static TextStyle font18BlackBold() =>
      GoogleFonts.tajawal(fontSize: 18.sp, fontWeight: FontWeightHelper.bold);

  static TextStyle font16BlackRegular() => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14BlackRegular() => GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14BlackBold() =>
      GoogleFonts.tajawal(fontSize: 14.sp, fontWeight: FontWeightHelper.bold);

  // Blue
  static TextStyle font13BlueBold() => GoogleFonts.tajawal(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lightBlue,
  );

  static TextStyle font16BlueBold() => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lightBlue,
  );

  // Grey
  static TextStyle font13greyRegular() => GoogleFonts.tajawal(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.grey,
  );

  static TextStyle font16GreyRegular() => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.grey,
  );

  static TextStyle font18GreyRegular() => GoogleFonts.tajawal(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.grey,
  );

  static TextStyle font16GreyRegularAlt() => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.grey,
  );

  // White
  static TextStyle font24WhiteBold() => GoogleFonts.tajawal(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  static TextStyle font24WhiteRegular() => GoogleFonts.tajawal(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font18WhiteRegular() => GoogleFonts.tajawal(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font16WhiteRegular() => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
}
