import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';

class CustomColors {
  // Backgrounds
  final Color background;
  final Color surface;
  final Color surfaceVariant;

  // Text
  final Color textPrimary;
  final Color textSecondary;

  // Borders & Dividers
  final Color border;
  final Color divider;

  // Status Containers
  final Color successContainer;
  final Color infoContainer;
  final Color warningContainer;
  final Color errorContainer;

  // Brand / Accent
  final Color accentBlue;
  final Color accentBlueSoft;

  const CustomColors._({
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.divider,
    required this.successContainer,
    required this.infoContainer,
    required this.warningContainer,
    required this.errorContainer,
    required this.accentBlue,
    required this.accentBlueSoft,
  });

  factory CustomColors({
    required final Color background,
    required final Color surface,
    required final Color surfaceVariant,
    required final Color textPrimary,
    required final Color textSecondary,
    required final Color border,
    required final Color divider,
    required final Color successContainer,
    required final Color infoContainer,
    required final Color warningContainer,
    required final Color errorContainer,
    required final Color accentBlue,
    required final Color accentBlueSoft,
  }) {
    return CustomColors._(
      background: background,
      surface: surface,
      surfaceVariant: surfaceVariant,
      textPrimary: textPrimary,
      textSecondary: textSecondary,
      border: border,
      divider: divider,
      successContainer: successContainer,
      infoContainer: infoContainer,
      warningContainer: warningContainer,
      errorContainer: errorContainer,
      accentBlue: accentBlue,
      accentBlueSoft: accentBlueSoft,
    );
  }

  /*──────────────── LIGHT ────────────────*/
  factory CustomColors.light() {
    return const CustomColors._(
      background: AppColors.grey25,
      surface: AppColors.grey0,
      surfaceVariant: AppColors.grey100,

      textPrimary: AppColors.grey900,
      textSecondary: AppColors.grey600,

      border: AppColors.grey300,
      divider: AppColors.grey200,

      successContainer: AppColors.lightGreen,
      infoContainer: AppColors.lightBlue,
      warningContainer: AppColors.warning25,
      errorContainer: AppColors.error25,

      accentBlue: AppColors.openBlue600,
      accentBlueSoft: AppColors.openBlue100,
    );
  }

  /*──────────────── DARK ────────────────*/
  factory CustomColors.dark() {
    return const CustomColors._(
      background: AppColors.grey900,
      surface: AppColors.grey800,
      surfaceVariant: AppColors.grey700,

      textPrimary: AppColors.grey100,
      textSecondary: AppColors.grey400,

      border: AppColors.grey600,
      divider: AppColors.grey700,

      successContainer: AppColors.darkGreen,
      infoContainer: AppColors.darkBlue,
      warningContainer: AppColors.warning300,
      errorContainer: AppColors.error300,

      accentBlue: AppColors.openBlue400,
      accentBlueSoft: AppColors.openBlue800,
    );
  }
}
