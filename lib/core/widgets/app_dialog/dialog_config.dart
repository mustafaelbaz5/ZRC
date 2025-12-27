import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

enum DialogType { error, success, warning, info, confirmation }

class DialogConfig {
  final IconData icon;
  final Color iconColor;
  final Color? primaryButtonColor;
  final Color? secondaryButtonColor;

  const DialogConfig({
    required this.icon,
    required this.iconColor,
    this.primaryButtonColor,
    this.secondaryButtonColor,
  });

  factory DialogConfig.fromType(final DialogType type) {
    switch (type) {
      case DialogType.error:
        return const DialogConfig(
          icon: Icons.error_outline_rounded,
          iconColor: AppColors.error100,
          primaryButtonColor: AppColors.error100,
        );
      case DialogType.success:
        return const DialogConfig(
          icon: Icons.check_circle_outline_rounded,
          iconColor: AppColors.success100,
          primaryButtonColor: AppColors.success100,
        );
      case DialogType.warning:
        return const DialogConfig(
          icon: Icons.warning_amber_rounded,
          iconColor: AppColors.warning100,
          primaryButtonColor: AppColors.warning100,
        );
      case DialogType.info:
        return const DialogConfig(
          icon: Icons.info_outline_rounded,
          iconColor: AppColors.grey500,
          primaryButtonColor: AppColors.grey500,
        );
      case DialogType.confirmation:
        return const DialogConfig(
          icon: Icons.help_outline_rounded,
          iconColor: AppColors.success100,
          primaryButtonColor: AppColors.success100,
          secondaryButtonColor: AppColors.grey500,
        );
    }
  }
}
