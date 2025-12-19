import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(responsiveWidth(12)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(16),
          vertical: responsiveHeight(12),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.customColors.accentBlue.withAlpha((0.1 * 255).toInt())
              : Colors.transparent,
          borderRadius: BorderRadius.circular(responsiveWidth(12)),
          border: Border.all(
            color: isSelected
                ? context.customColors.accentBlue
                : context.customColors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: isSelected
                  ? AppTextStyles.font14Bold.copyWith(
                      color: context.customColors.accentBlue,
                    )
                  : AppTextStyles.font14Regular.copyWith(
                      color: context.customColors.textSecondary,
                    ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: context.customColors.accentBlue,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
