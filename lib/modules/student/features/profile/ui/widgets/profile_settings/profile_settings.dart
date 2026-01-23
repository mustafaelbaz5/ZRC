import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../profile_menu_item.dart';
import '../profile_section_body.dart';
import 'language_option.dart';
import 'theme_option.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    super.key,
    this.onSwitchLanguageTap,
    this.onSwitchThemeTap,
  });

  final VoidCallback? onSwitchLanguageTap;
  final VoidCallback? onSwitchThemeTap;

  @override
  Widget build(final BuildContext context) {
    final bool isArabic = context.isArabic;

    return ProfileSectionBody(
      title: 'student_profile.settings.title'.tr(),
      items: <Widget>[
        ProfileMenuItem(
          icon: Icons.language_outlined,
          title: 'student_profile.settings.language'.tr(),
          subtitle: isArabic
              ? 'student_profile.settings.arabic'.tr()
              : 'student_profile.settings.english'.tr(),
          onTap: () => _showLanguageDialog(context),
        ),

        ProfileMenuItem(
          icon: Icons.palette_outlined,
          title: 'student_profile.settings.theme'.tr(),
          subtitle: context.isDarkMode
              ? 'student_profile.settings.dark_mode'.tr()
              : 'student_profile.settings.light_mode'.tr(),
          onTap: () => _showThemeDialog(context),
        ),
      ],
    );
  }

  void _showLanguageDialog(final BuildContext context) {
    final bool isArabic = context.isArabic;

    showDialog(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        backgroundColor: context.customColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'student_profile.settings.select_language'.tr(),
          style: AppTextStyles.font18Bold.copyWith(
            color: context.customColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // English option
            LanguageOption(
              title: 'student_profile.settings.english'.tr(),
              isSelected: !isArabic,
              onTap: () {
                Navigator.pop(context);
                // Tap callback switches the language
                if (onSwitchLanguageTap != null) onSwitchLanguageTap!();
              },
            ),

            verticalSpacing(6),

            // Arabic option
            LanguageOption(
              title: 'student_profile.settings.arabic'.tr(),
              isSelected: isArabic,
              onTap: () {
                Navigator.pop(context);
                // Tap callback switches the language
                if (onSwitchLanguageTap != null) onSwitchLanguageTap!();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(final BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        backgroundColor: context.customColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'student_profile.settings.select_theme'.tr(),
          style: AppTextStyles.font18Bold.copyWith(
            color: context.customColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ThemeOption(
              title: 'student_profile.settings.light'.tr(),
              icon: Icons.light_mode,
              isSelected: !isDark,
              onTap: () {
                Navigator.pop(context);
                // Tap callback switches the theme
                if (onSwitchThemeTap != null) onSwitchThemeTap!();
              },
            ),

            verticalSpacing(8),

            ThemeOption(
              title: 'student_profile.settings.dark'.tr(),
              icon: Icons.dark_mode,
              isSelected: isDark,
              onTap: () {
                Navigator.pop(context);
                // Tap callback switches the theme
                if (onSwitchThemeTap != null) onSwitchThemeTap!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
