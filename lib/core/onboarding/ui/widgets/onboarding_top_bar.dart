import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_text_styles.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLanguageButton(context),
          if (showSkip) _buildSkipButton(),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(final BuildContext context) {
    return TextButton.icon(
      onPressed: onChangeLanguage,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      icon: Icon(Icons.language, size: 20.sp, color: Colors.grey[600]),
      label: Text(
        context.locale.languageCode.toUpperCase(),
        style: AppTextStyles.font16BlackBold(),
      ),
    );
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: onSkip,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(
        'onboarding.button_skip'.tr(),
        style: AppTextStyles.font16BlueBold(),
      ),
    );
  }
}
