import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

import 'dialog_button.dart';
import 'dialog_config.dart';

class AppDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final DialogConfig config;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final Widget? customContent;

  const AppDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.config,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.customContent,
  });

  @override
  Widget build(final BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 8,
      backgroundColor: context.customColors.surface,
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: context.customColors.surface,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(),
            verticalSpacing(20),
            _buildTitle(context),
            verticalSpacing(12),
            _buildMessage(context),
            if (customContent != null) ...[verticalSpacing(16), customContent!],
            verticalSpacing(24),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.elasticOut,
      builder: (final context, final value, final child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: config.iconColor.withValues(alpha: 0.1),
          boxShadow: [
            BoxShadow(
              color: config.iconColor.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: config.iconColor.withValues(alpha: 0.2),
          ),
          child: Icon(config.icon, color: config.iconColor, size: 42.sp),
        ),
      ),
    );
  }

  Widget _buildTitle(final BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.font20Bold.copyWith(
        color: context.customColors.textPrimary,
      ),
    );
  }

  Widget _buildMessage(final BuildContext context) {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: AppTextStyles.font16Regular.copyWith(
        color: context.customColors.textSecondary,
        height: 1.5,
      ),
    );
  }

  Widget _buildButtons(final BuildContext context) {
    final hasSecondaryButton = secondaryButtonText != null;

    if (hasSecondaryButton) {
      return Row(
        children: [
          Expanded(
            child: DialogButton(
              text: secondaryButtonText!,
              onPressed: onSecondaryPressed!,
              isOutlined: true,
              color: config.secondaryButtonColor ?? AppColors.grey300,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: DialogButton(
              text: primaryButtonText,
              onPressed: onPrimaryPressed,
              color: config.primaryButtonColor ?? config.iconColor,
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: DialogButton(
        text: primaryButtonText,
        onPressed: onPrimaryPressed,
        color: config.primaryButtonColor ?? config.iconColor,
      ),
    );
  }
}
