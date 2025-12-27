import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'language_setting_tile.dart';
import 'theme_setting_tile.dart';

class DrawerSettingsSection extends StatelessWidget {
  const DrawerSettingsSection({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(20),
            vertical: responsiveHeight(8),
          ),
          child: Text(
            'instructor_drawer.settings'.tr(),
            style: AppTextStyles.font14Bold.copyWith(
              color: context.customColors.textSecondary,
            ),
          ),
        ),
        verticalSpacing(4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(12)),
          child: Column(
            children: [
              const ThemeSettingTile(),
              verticalSpacing(8),
              const LanguageSettingTile(),
            ],
          ),
        ),
      ],
    );
  }
}
