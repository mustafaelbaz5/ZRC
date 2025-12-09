import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              ? <Color>[Colors.green[600]!, Colors.green[400]!]
              : <Color>[Colors.orange[600]!, Colors.orange[400]!],
        ),
      ),
      child: Column(
        children: <Widget>[
          // Icon with animation effect
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.2 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isPassed ? Icons.emoji_events : Icons.pending_actions,
                size: 60.sp,
                color: Colors.white,
              ),
            ),
          ),
          verticalSpacing(16),
          Text(
            isPassed
                ? tr('student_quizzes.quiz_result.header.congratulations')
                : tr('student_quizzes.quiz_result.header.keep_trying'),
            style: AppTextStyles.font24WhiteBold(),
          ),
          verticalSpacing(8),
          Text(
            isPassed
                ? tr('student_quizzes.quiz_result.header.passed_message')
                : tr('student_quizzes.quiz_result.header.improve_message'),
            style: AppTextStyles.font16WhiteRegular(),
          ),
        ],
      ),
    );
  }
}
