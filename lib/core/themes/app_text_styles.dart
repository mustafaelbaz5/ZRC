import 'package:flutter/material.dart';
import '../utils/spacing.dart';

import 'app_font_weight.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle font32Bold = TextStyle(
    fontSize: responsiveFontSize(32),
    fontWeight: AppFontWeight.bold,
  );

  static TextStyle font24Bold = TextStyle(
    fontSize: responsiveFontSize(24),
    fontWeight: AppFontWeight.bold,
  );

  static TextStyle font20Bold = TextStyle(
    fontSize: responsiveFontSize(20),
    fontWeight: AppFontWeight.bold,
  );

  static TextStyle font18Bold = TextStyle(
    fontSize: responsiveFontSize(18),
    fontWeight: AppFontWeight.bold,
  );

  static TextStyle font16Bold = TextStyle(
    fontSize: responsiveFontSize(16),
    fontWeight: AppFontWeight.bold,
  );

  static TextStyle font14Bold = TextStyle(
    fontSize: responsiveFontSize(14),
    fontWeight: AppFontWeight.bold,
  );
  static const TextStyle font13Bold = TextStyle(
    fontSize: 13,
    fontWeight: AppFontWeight.bold,
  );

  // -----------------------------
  // REGULAR TEXT
  // -----------------------------
  static TextStyle font24Regular = TextStyle(
    fontSize: responsiveFontSize(24),
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle font18Regular = TextStyle(
    fontSize: responsiveFontSize(18),
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle font16Regular = TextStyle(
    fontSize: responsiveFontSize(16),
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle font14Regular = TextStyle(
    fontSize: responsiveFontSize(14),
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle font13Regular = TextStyle(
    fontSize: responsiveFontSize(13),
    fontWeight: AppFontWeight.regular,
  );
}
