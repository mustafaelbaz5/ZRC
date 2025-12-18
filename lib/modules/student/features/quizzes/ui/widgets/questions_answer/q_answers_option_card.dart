import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class QAnswersOptionCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const QAnswersOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: responsiveHeight(12)),
        padding: EdgeInsets.all(responsiveWidth(16)),
        decoration: BoxDecoration(
          color: isSelected
              ? context.customColors.textSecondary
              : context.customColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? context.customColors.textPrimary
                : context.customColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: <BoxShadow>[
            if (isSelected)
              BoxShadow(
                color: AppColors.primary200.withAlpha((0.04 * 255).toInt()),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: responsiveWidth(24),
              height: responsiveWidth(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.customColors.surfaceVariant
                      : context.customColors.border,
                  width: 2,
                ),
                color: isSelected
                    ? context.customColors.textPrimary
                    : context.customColors.surface,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16.sp,
                      color: context.customColors.surfaceVariant,
                    )
                  : null,
            ),
            horizontalSpacing(12),
            Expanded(
              child: Text(
                option,
                style: AppTextStyles.font16Bold.copyWith(
                  color: isSelected
                      ? AppColors.grey0
                      : context.customColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
