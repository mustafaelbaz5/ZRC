import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/functions/app_language.dart';
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
    final bool isArabic = isAppLanguageArabic(context);

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
          subtitle: 'student_profile.settings.light_mode'.tr(),
          onTap: () => _showThemeDialog(context),
        ),
      ],
    );
  }

  void _showLanguageDialog(final BuildContext context) {
    final bool isArabic = isAppLanguageArabic(context);

    showDialog(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'student_profile.settings.select_language'.tr(),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
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

            SizedBox(height: 8.h),

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'student_profile.settings.select_theme'.tr(),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
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
            SizedBox(height: 8.h),
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
