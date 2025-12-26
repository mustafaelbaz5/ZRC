import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';

import '../../core/widgets/custom_text_button.dart';
import '../extensions/context_extensions.dart';
import '../router/routes.dart';
import '../storage/user_storage.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import 'app_dialog/app_dialogs.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _handleLogout(final BuildContext context) async {
    final confirmed = await AppDialogs.showConfirmation(
      context: context,
      title: 'student_profile.logout.dialog_title'.tr(),
      message: 'student_profile.logout.dialog_message'.tr(),
      confirmText: 'student_profile.logout.confirm'.tr(),
      cancelText: 'student_profile.logout.cancel'.tr(),
    );

    if (confirmed! && context.mounted) {
      try {
        await UserStorage().clearUser();
        if (context.mounted) {
          context.pushNamedAndRemoveAll(Routes.onBoardingScreen);
        }
      } catch (e) {
        debugPrint('Error during logout: $e');
      }
    }
  }

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
      onPressed: () => _handleLogout(context),
    );
  }
}
