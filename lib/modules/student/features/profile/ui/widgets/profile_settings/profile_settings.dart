import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/utils/functions/app_language.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_settings/language_option.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_menu_item.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_section_body.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_settings/theme_option.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key, this.onSwitchLanguageTap});

  final VoidCallback? onSwitchLanguageTap;

  @override
  Widget build(BuildContext context) {
    final isArabic = isAppLanguageArabic(context);

    return ProfileSectionBody(
      title: 'Settings',
      items: [
        ProfileMenuItem(
          icon: Icons.language_outlined,
          title: 'Language',
          subtitle: isArabic ? 'العربية' : 'English',
          onTap: () => _showLanguageDialog(context),
        ),

        ProfileMenuItem(
          icon: Icons.palette_outlined,
          title: 'Theme',
          subtitle: 'Light mode',
          onTap: () => _showThemeDialog(context),
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final isArabic = isAppLanguageArabic(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'Select Language',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // English option
            LanguageOption(
              title: 'English',
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
              title: 'العربية',
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

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'Select Theme',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeOption(
              title: 'Light',
              icon: Icons.light_mode,
              isSelected: true,
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(height: 8.h),
            ThemeOption(
              title: 'Dark',
              icon: Icons.dark_mode,
              isSelected: false,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
