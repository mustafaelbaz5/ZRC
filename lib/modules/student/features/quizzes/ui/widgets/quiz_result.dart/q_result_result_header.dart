import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class QResultResultHeader extends StatelessWidget {
  final bool isPassed;
  final int percentage;

  const QResultResultHeader({
    super.key,
    required this.isPassed,
    required this.percentage,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isPassed
              ? <Color>[AppColors.success300, AppColors.success200]
              : <Color>[AppColors.error300, AppColors.error200],
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: responsiveWidth(100),
            height: responsiveHeight(100),
            decoration: BoxDecoration(
              color: AppColors.grey0.withAlpha((0.2 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isPassed ? Icons.emoji_events : Icons.pending_actions,
                size: responsiveWidth(60),
                color: AppColors.grey0,
              ),
            ),
          ),
          verticalSpacing(16),
          Text(
            isPassed
                ? tr('student_quizzes.quiz_result.header.congratulations')
                : tr('student_quizzes.quiz_result.header.keep_trying'),
            style: AppTextStyles.font24Bold.copyWith(color: AppColors.grey0),
          ),
          verticalSpacing(8),
          Text(
            isPassed
                ? tr('student_quizzes.quiz_result.header.passed_message')
                : tr('student_quizzes.quiz_result.header.improve_message'),
            style: AppTextStyles.font16Regular.copyWith(color: AppColors.grey0),
          ),
        ],
      ),
    );
  }
}
