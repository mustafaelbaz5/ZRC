import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTitle(), verticalSpacing(16.h), _buildSubtitle()],
    );
  }

  Widget _buildTitle() {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: AppTextStyles.font32BlackBold.copyWith(
        fontSize: 28.sp,
        height: 1.3,
        letterSpacing: -0.5,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildSubtitle() {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: AppTextStyles.font18GreyRegular.copyWith(
        fontSize: 16.sp,
        color: Colors.grey[600],
        height: 1.5,
      ),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
