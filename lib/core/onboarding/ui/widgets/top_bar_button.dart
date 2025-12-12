import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';

/// Reusable text button for top bar
class TopBarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isOutlined;

  const TopBarButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isOutlined = false,
  });

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: isOutlined
          ? Colors.transparent
          : context.customColors.containerColor,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: isOutlined
              ? BoxDecoration(borderRadius: BorderRadius.circular(12.r))
              : null,
          child: Text(
            label,
            style: AppTextStyles.font16Bold.copyWith(
              color: context.customColors.onContainerPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
