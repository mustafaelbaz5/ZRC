import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../extensions/context_extensions.dart';
import '../themes/app_colors.dart';
import 'app_dialog/app_dialogs.dart';

import '../router/routes.dart';
import '../storage/user_storage.dart';
import '../themes/app_text_styles.dart';
import 'custom_text_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _handleLogout(final BuildContext context) async {
    await AppDialogs.showConfirmation(
      context: context,
      title: 'student_profile.logout.dialog_title'.tr(),
      message: 'student_profile.logout.dialog_message'.tr(),
      confirmText: 'student_profile.logout.confirm'.tr(),
      cancelText: 'student_profile.logout.cancel'.tr(),
      onConfirm: () async {
        if (context.mounted) {
          try {
            await UserStorage().clearUser();

            if (context.mounted) {
              context.pushNamedAndRemoveAll(Routes.onBoardingScreen);
            }
          } catch (e) {
            debugPrint('Error during logout: $e');
          }
        }
      },
      onCancel: () {},
    );
  }

  @override
  Widget build(final BuildContext context) {
    return CustomTextButton(
      buttonWidth: 250,
      buttonHeight: 50,
      backgroundColor: AppColors.error300,
      buttonText: 'student_profile.logout.button'.tr(),
      textStyle: AppTextStyles.font18Regular.copyWith(color: AppColors.grey0),
      onPressed: () => _handleLogout(context),
    );
  }
}
