import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/app_setting_fun.dart';
import 'package:zrc/core/utils/spacing.dart';

class LanguageSettingTile extends StatelessWidget {
  const LanguageSettingTile({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final isArabic = context.isArabic;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(responsiveRadius(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(responsiveRadius(16)),
        onTap: () => switchLanguage(context),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(16),
            vertical: responsiveHeight(16),
          ),
          child: Row(
            children: [
              // Icon with subtle background
              Container(
                padding: EdgeInsets.all(responsiveWidth(10)),

                child: Icon(
                  Icons.language_rounded,
                  size: responsiveRadius(24),
                  color: colors.accentBlue,
                ),
              ),

              horizontalSpacing(16),

              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'instructor_drawer.language'.tr(),
                      style: AppTextStyles.font14Bold.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    verticalSpacing(4),
                    Text(
                      isArabic
                          ? 'instructor_drawer.common.arabic'.tr()
                          : 'instructor_drawer.common.english'.tr(),
                      style: AppTextStyles.font13Regular.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Trailing arrow
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: responsiveRadius(18),
                color: colors.textSecondary.withValues(alpha: 0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
