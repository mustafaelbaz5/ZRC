import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';

class CustomColors {
  final Color secondaryColor;
  final Color containerColor;
  final Color onContainerPrimary;
  final Color onContainerSecondary;
  final Color borderColor;
  final Color backgroundColor;

  const CustomColors._({
    required this.secondaryColor,
    required this.containerColor,
    required this.onContainerPrimary,
    required this.onContainerSecondary,
    required this.borderColor,
    required this.backgroundColor,
  });

  factory CustomColors({
    required final Color secondaryColor,
    required final Color containerColor,
    required final Color onContainerPrimary,
    required final Color onContainerSecondary,
    required final Color borderColor,
    required final Color backgroundColor,
  }) {
    return CustomColors._(
      secondaryColor: secondaryColor,
      containerColor: containerColor,
      onContainerPrimary: onContainerPrimary,
      onContainerSecondary: onContainerSecondary,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
    );
  }
  factory CustomColors._light() {
    return const CustomColors._(
      secondaryColor: AppColors.grey200,
      containerColor: AppColors.grey100,
      onContainerPrimary: AppColors.grey900,
      onContainerSecondary: AppColors.grey600,
      borderColor: AppColors.grey300,
      backgroundColor: AppColors.grey50,
    );
  }
  factory CustomColors._dark() {
    return const CustomColors._(
      secondaryColor: AppColors.grey800,
      containerColor: AppColors.grey700,
      onContainerPrimary: AppColors.grey100,
      onContainerSecondary: AppColors.grey400,
      borderColor: AppColors.grey600,
      backgroundColor: AppColors.grey900,
    );
  }
}

extension CustomColorsExtension on ThemeData {
  CustomColors get customColors {
    if (brightness == Brightness.light) {
      return CustomColors._light();
    } else {
      return CustomColors._dark();
    }
  }
}
