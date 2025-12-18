import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class FilterChipItem extends StatelessWidget {
  const FilterChipItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.height,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(final BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(8)),
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 24.r : 16.r,
        vertical: isSelected ? 0.r : 8.r,
      ),
      height: height ?? responsiveHeight(40),
      decoration: BoxDecoration(
        color: isSelected
            ? context.customColors.surface
            : context.customColors.surfaceVariant,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: isSelected
              ? context.customColors.textPrimary
              : context.customColors.surfaceVariant,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24.r),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppTextStyles.font14Bold.copyWith(
                      color: context.customColors.textPrimary,
                    )
                  : AppTextStyles.font13Bold.copyWith(
                      fontSize: 12,
                      color: context.customColors.textSecondary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
