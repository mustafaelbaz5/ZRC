import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class QResultsScoreCard extends StatelessWidget {
  final int score;
  final int totalMarks;
  final int percentage;
  final bool isPassed;

  const QResultsScoreCard({
    super.key,
    required this.score,
    required this.totalMarks,
    required this.percentage,
    required this.isPassed,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha((0.4 * 255).toInt()),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            tr('student_quizzes.quiz_result.score.your_score'),
            style: AppTextStyles.font16Regular.copyWith(
              color: AppColors.grey300,
            ),
          ),
          verticalSpacing(16),
          // Circular Progress
          SizedBox(
            width: 150.w,
            height: 150.w,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150.w,
                  height: 150.w,
                  child: CircularProgressIndicator(
                    value: percentage / 100,
                    strokeWidth: 12.w,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isPassed ? Colors.green[600]! : Colors.orange[600]!,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w800,
                        color: isPassed
                            ? Colors.green[700]
                            : Colors.orange[700],
                      ),
                    ),
                    Text(
                      '$score / $totalMarks',
                      style: AppTextStyles.font16Regular.copyWith(
                        color: AppColors.grey300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacing(24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isPassed ? Colors.green[100] : Colors.orange[100],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  isPassed ? Icons.check_circle : Icons.info,
                  size: 18.sp,
                  color: isPassed ? Colors.green[700] : Colors.orange[700],
                ),
                SizedBox(width: 8.w),
                Text(
                  isPassed
                      ? tr('student_quizzes.quiz_result.score.passed')
                      : tr('student_quizzes.quiz_result.score.not_passed'),
                  style: AppTextStyles.font16Regular.copyWith(
                    color: AppColors.grey300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
