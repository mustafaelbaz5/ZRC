import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../themes/app_text_styles.dart';
import '../../../utils/spacing.dart';

class OnBoardingTextContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnBoardingTextContent({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitle(),
        verticalSpacing(16.h),
        _buildSubtitle(),
      ],
    );
  }

  Widget _buildTitle() {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: AppTextStyles.font32Bold,
      child: Text(
        title.tr(),
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildSubtitle() {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: AppTextStyles.font16Regular.copyWith(color: AppColors.grey300),
      child: Text(
        subtitle.tr(),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
