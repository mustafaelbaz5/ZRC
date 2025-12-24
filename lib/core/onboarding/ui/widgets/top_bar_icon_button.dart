import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../extensions/context_extensions.dart';
import '../../../themes/app_text_styles.dart';
import '../../../utils/spacing.dart';

/// Reusable icon button for top bar actions
class TopBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? label;
  final String? tooltip;

  const TopBarIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.label,
    this.tooltip,
  });

  @override
  Widget build(final BuildContext context) {
    final button = Material(
      color: context.customColors.surface,
      borderRadius: BorderRadius.circular(12.r),
      elevation: 0,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: label != null ? 12.w : 10.w,
            vertical: 10.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20.sp,
                color: context.customColors.textSecondary,
              ),
              if (label != null) ...[
                horizontalSpacing(6.w),
                Text(
                  label!,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customColors.textPrimary,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    return tooltip != null ? Tooltip(message: tooltip!, child: button) : button;
  }
}
