import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import 'q_results_analysis_row.dart';

class QResultsPerformanceAnalysis extends StatelessWidget {
  final bool isPassed;
  final int percentage;
  final int passingMarks;

  const QResultsPerformanceAnalysis({
    super.key,
    required this.isPassed,
    required this.percentage,
    required this.passingMarks,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.background.withAlpha(
              (0.04 * 255).toInt(),
            ),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.analytics_outlined,
                size: 20.sp,
                color: context.customColors.textPrimary,
              ),
              horizontalSpacing(8),
              Text(
                tr('student_quizzes.quiz_result.performance.title'),
                style: AppTextStyles.font16Bold,
              ),
            ],
          ),
          verticalSpacing(16),
          QResultsAnalysisRow(
            label: tr('student_quizzes.quiz_result.performance.your_score'),
            value: '$percentage%',
            color: isPassed
                ? context.customColors.successContainer
                : context.customColors.warningContainer,
          ),
          verticalSpacing(12),
          QResultsAnalysisRow(
            label: tr('student_quizzes.quiz_result.performance.passing_score'),
            value: '$passingMarks%',
            color: context.customColors.accentBlueSoft,
          ),
          verticalSpacing(12),
          QResultsAnalysisRow(
            label: tr('student_quizzes.quiz_result.performance.difference'),
            value: '${(percentage - passingMarks).abs()}%',
            color: context.customColors.textSecondary,
          ),
          verticalSpacing(12),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isPassed
                  ? context.customColors.successContainer.withAlpha(
                      (0.09 * 255).toInt(),
                    )
                  : context.customColors.warningContainer.withAlpha(
                      (0.09 * 255).toInt(),
                    ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  isPassed ? Icons.lightbulb_outline : Icons.info_outline,
                  size: 18.sp,
                  color: isPassed
                      ? context.customColors.successContainer
                      : context.customColors.warningContainer,
                ),
                horizontalSpacing(10),
                Expanded(
                  child: Text(
                    isPassed
                        ? tr(
                            'student_quizzes.quiz_result.performance.excellent_work',
                          )
                        : tr(
                            'student_quizzes.quiz_result.performance.review_material',
                          ),
                    style: AppTextStyles.font13Regular.copyWith(
                      color: context.customColors.textSecondary,
                    ),
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
