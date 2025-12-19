import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';

import '../../../../../../../core/utils/spacing.dart';

class TrueFalseCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const TrueFalseCard({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withAlpha((0.04 * 255).toInt())
              : context.theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? color : AppColors.grey300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: <BoxShadow>[
            if (isSelected)
              BoxShadow(
                color: color.withAlpha((0.2 * 255).toInt()),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 48.sp,
              color: isSelected ? color : AppColors.grey400,
            ),
            verticalSpacing(16),
            Text(
              label,
              style: AppTextStyles.font16Bold.copyWith(
                color: isSelected ? color : AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
