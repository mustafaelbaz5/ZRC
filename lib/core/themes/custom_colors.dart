import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';

class CustomColors {
  final Color secondaryColor;
  final Color containerColor;
  final Color onContainerPrimary;
  final Color onContainerSecondary;
  final Color borderColor;
  final Color backgroundColor;
  final Color blueContainer;
  final Color greenContainer;

  const CustomColors._({
    required this.secondaryColor,
    required this.containerColor,
    required this.onContainerPrimary,
    required this.onContainerSecondary,
    required this.borderColor,
    required this.backgroundColor,
    required this.blueContainer,
    required this.greenContainer,
  });

  factory CustomColors({
    required final Color secondaryColor,
    required final Color containerColor,
    required final Color onContainerPrimary,
    required final Color onContainerSecondary,
    required final Color borderColor,
    required final Color backgroundColor,
    required final Color blueContainer,
    required final Color greenContainer,
  }) {
    return CustomColors._(
      secondaryColor: secondaryColor,
      containerColor: containerColor,
      onContainerPrimary: onContainerPrimary,
      onContainerSecondary: onContainerSecondary,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      blueContainer: blueContainer,
      greenContainer: greenContainer,
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
      blueContainer: AppColors.lightBlue,
      greenContainer: AppColors.lightGreen,
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
      blueContainer: AppColors.darkBlue,
      greenContainer: AppColors.darkGreen,
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
