import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_colors.dart';

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
      margin: EdgeInsets.symmetric(vertical: responsiveHeight(24)),
      padding: EdgeInsets.all(responsiveWidth(24)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.textSecondary.withAlpha(
              (0.4 * 255).toInt(),
            ),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            tr('student_quizzes.quiz_result.score.your_score'),
            style: AppTextStyles.font16Regular.copyWith(
              color: context.customColors.textSecondary,
            ),
          ),
          verticalSpacing(16),
          // Circular Progress
          SizedBox(
            width: responsiveWidth(150),
            height: responsiveHeight(150),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  width: responsiveWidth(150),
                  height: responsiveHeight(150),
                  child: CircularProgressIndicator(
                    value: percentage / 100,
                    strokeWidth: responsiveWidth(12),
                    backgroundColor: AppColors.grey0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isPassed ? AppColors.success200 : AppColors.error200,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '$percentage%',
                      style: AppTextStyles.font32Bold.copyWith(
                        color: isPassed
                            ? AppColors.success100
                            : AppColors.error100,
                      ),
                    ),
                    Text(
                      '$score / $totalMarks',
                      style: AppTextStyles.font16Regular.copyWith(
                        color: AppColors.grey0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacing(24),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(16),
              vertical: responsiveHeight(10),
            ),
            decoration: BoxDecoration(
              color: isPassed ? AppColors.success200 : AppColors.error200,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  isPassed ? Icons.check_circle : Icons.info,
                  size: 18.sp,
                  color: isPassed ? AppColors.success300 : AppColors.error300,
                ),
                horizontalSpacing(16),
                Text(
                  isPassed
                      ? tr('student_quizzes.quiz_result.score.passed')
                      : tr('student_quizzes.quiz_result.score.not_passed'),
                  style: AppTextStyles.font16Regular.copyWith(
                    color: AppColors.grey0,
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
