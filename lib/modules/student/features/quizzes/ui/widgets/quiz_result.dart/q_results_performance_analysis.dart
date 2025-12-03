import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_analysis_row.dart';

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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 20.sp,
                color: Colors.blue[700],
              ),
              horizontalSpacing(8),
              Text(
                'Performance Analysis',
                style: AppTextStyles.font16BlackBold(),
              ),
            ],
          ),
          verticalSpacing(16),
          QResultsAnalysisRow(
            label: 'Your Score',
            value: '$percentage%',
            color: isPassed ? Colors.green : Colors.orange,
          ),
          verticalSpacing(12),
          QResultsAnalysisRow(
            label: 'Passing Score',
            value: '$passingMarks%',
            color: Colors.blue,
          ),
          verticalSpacing(12),
          QResultsAnalysisRow(
            label: 'Difference',
            value: '${(percentage - passingMarks).abs()}%',
            color: Colors.grey,
          ),
          verticalSpacing(12),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isPassed
                  ? Colors.green.withAlpha((0.09 * 255).toInt())
                  : Colors.blue.withAlpha((0.09 * 255).toInt()),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  isPassed ? Icons.lightbulb_outline : Icons.info_outline,
                  size: 18.sp,
                  color: isPassed ? Colors.green[700] : Colors.blue[700],
                ),
                horizontalSpacing(10),
                Expanded(
                  child: Text(
                    isPassed
                        ? 'Excellent work! Keep up the good performance.'
                        : 'Review the material and try again to improve your score.',
                    style: AppTextStyles.font13greyRegular(),
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
