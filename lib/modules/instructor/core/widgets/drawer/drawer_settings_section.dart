import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/app_setting_fun.dart';
import 'package:zrc/core/utils/spacing.dart';

class DrawerSettingsSection extends StatelessWidget {
  const DrawerSettingsSection({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final currentLocale = context.locale.languageCode.toUpperCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            tr('instructor_drawer.settings'),
            style: AppTextStyles.font13Bold.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.brightness_6_outlined,
            color: colors.textSecondary,
          ),
          title: Text(
            tr('instructor_drawer.theme'),
            style: AppTextStyles.font14Bold.copyWith(color: colors.textPrimary),
          ),
          subtitle: Text(
            isDarkMode ? 'Dark Mode' : 'Light Mode',
            style: AppTextStyles.font13Regular.copyWith(
              color: colors.textSecondary,
            ),
          ),
          trailing: Switch(
            value: isDarkMode,
            onChanged: (_) => switchTheme(context),
            activeThumbColor: colors.accentBlue,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onTap: () => switchTheme(context),
        ),
        ListTile(
          leading: Icon(Icons.language_outlined, color: colors.textSecondary),
          title: Text(
            tr('instructor_drawer.language'),
            style: AppTextStyles.font14Bold.copyWith(color: colors.textPrimary),
          ),
          subtitle: Text(
            currentLocale,
            style: AppTextStyles.font13Regular.copyWith(
              color: colors.textSecondary,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onTap: () => switchLanguage(context),
        ),
        verticalSpacing(16),
      ],
    );
  }
}
