import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';

import '../../../utils/functions/app_setting_fun.dart';
import '../../../utils/spacing.dart';
import 'top_bar_button.dart';
import 'top_bar_icon_button.dart';

class OnBoardingTopBar extends StatelessWidget {
  final bool showSkip;

  const OnBoardingTopBar({super.key, required this.showSkip});

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(20),
          vertical: responsiveHeight(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButtons(context),
            if (showSkip) _buildSkipButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TopBarIconButton(
          icon: Icons.language_rounded,
          onPressed: () => switchLanguage(context),
          label: context.locale.languageCode.toUpperCase(),
          tooltip: 'onboarding.change_language'.tr(),
        ),
        horizontalSpacing(12),
        TopBarIconButton(
          icon: _getThemeIcon(context),
          onPressed: () => switchTheme(context),
        ),
      ],
    );
  }

  Widget _buildSkipButton(final BuildContext context) {
    return AnimatedOpacity(
      opacity: showSkip ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: TopBarButton(
        onPressed: () => context.pushReplacementNamed(Routes.loginScreen),
        label: 'onboarding.button_skip'.tr(),
        isOutlined: true,
      ),
    );
  }

  IconData _getThemeIcon(final BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? Icons.light_mode_rounded
        : Icons.dark_mode_rounded;
  }
}
