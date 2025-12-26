import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/storage/user_storage.dart';
import 'package:zrc/core/widgets/app_dialog/app_dialogs.dart';

import '../../extensions/context_extensions.dart';
import '../../themes/cubit/theme_cubit.dart';

/// Switch Language between Arabic and English
void switchLanguage(final BuildContext context) {
  final Locale current = context.locale;

  // Switch locale
  if (current.languageCode == 'en') {
    context.setLocale(const Locale('ar'));
  } else {
    context.setLocale(const Locale('en'));
  }
  (context as Element).markNeedsBuild();
}

/// Switch Theme between Light and Dark
void switchTheme(final BuildContext context) {
  // Switch theme
  if (context.isDarkMode) {
    context.read<ThemeCubit>().updateTheme(ThemeMode.light);
  } else {
    context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
  }
}

Future<void> handleLogout(final BuildContext context) async {
  final confirmed = await AppDialogs.showConfirmation(
    context: context,
    title: 'general.logout.dialog_title'.tr(),
    message: 'general.logout.dialog_message'.tr(),
    confirmText: 'general.logout.confirm'.tr(),
    cancelText: 'general.logout.cancel'.tr(),
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
