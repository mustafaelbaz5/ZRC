import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/app_setting_fun.dart';
import 'package:zrc/core/utils/spacing.dart';

class ThemeSettingTile extends StatelessWidget {
  const ThemeSettingTile({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final isDarkMode = context.isDarkMode;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(responsiveRadius(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(responsiveRadius(16)),
        onTap: () => switchTheme(context),
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
                  isDarkMode
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
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
                      'instructor_drawer.theme'.tr(),
                      style: AppTextStyles.font14Bold.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    verticalSpacing(4),
                    Text(
                      isDarkMode
                          ? 'instructor_drawer.common.dark'.tr()
                          : 'instructor_drawer.common.light'.tr(),
                      style: AppTextStyles.font13Regular.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Switch
              Switch(
                value: isDarkMode,
                onChanged: (_) => switchTheme(context),
                activeThumbColor: colors.textPrimary,
                activeTrackColor: colors.surfaceVariant2,
                inactiveThumbColor: colors.textSecondary,
                inactiveTrackColor: colors.surfaceVariant,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
