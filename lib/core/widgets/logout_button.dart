import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_text_button.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import '../utils/functions/app_setting_fun.dart';
import '../utils/spacing.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return CustomTextButton(
      text: 'student_profile.logout.button'.tr(),
      style: CustomButtonStyle.filled,
      size: CustomButtonSize.large,
      backgroundColor: AppColors.error300,
      foregroundColor: Colors.white,
      textStyle: AppTextStyles.font16Bold,
      borderRadius: responsiveRadius(16),
      onPressed: () => handleLogout(context),
    );
  }
}
