import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'top_bar_button.dart';
import 'top_bar_icon_button.dart';
import '../../../utils/functions/app_setting_fun.dart';
import '../../../utils/spacing.dart';

class OnBoardingTopBar extends StatelessWidget {
  final bool showSkip;
  final VoidCallback onSkip;
  final VoidCallback onChangeLanguage;

  const OnBoardingTopBar({
    super.key,
    required this.showSkip,
    required this.onSkip,
    required this.onChangeLanguage,
  });

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
          onPressed: onChangeLanguage,
          label: context.locale.languageCode.toUpperCase(),
          tooltip: 'onboarding.change_language'.tr(),
        ),
        horizontalSpacing(12.w),
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
        onPressed: onSkip,
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
