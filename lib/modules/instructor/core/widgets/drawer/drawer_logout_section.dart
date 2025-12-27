import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/functions/app_setting_fun.dart';
import '../../../../../core/utils/spacing.dart';

class DrawerLogoutSection extends StatelessWidget {
  const DrawerLogoutSection({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(8),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.customColors.surface,
          borderRadius: BorderRadius.circular(responsiveRadius(16)),
        ),
        child: ListTile(
          leading: const Icon(Icons.logout_rounded, color: AppColors.error100),
          title: Text(
            'general.logout.button'.tr(),
            style: AppTextStyles.font16Bold.copyWith(color: AppColors.error100),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsiveRadius(16)),
          ),
          onTap: () => handleLogout(context),
        ),
      ),
    );
  }
}
