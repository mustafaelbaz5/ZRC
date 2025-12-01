import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_analysis_row.dart';

class QResultsPerformanceAnalysis extends StatelessWidget {
  final bool isPassed;
  final int percentage;
  final int passingMarks;

  const QResultsPerformanceAnalysis({super.key, 
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
            color: Colors.black.withOpacity(0.04),
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
              SizedBox(width: 8.w),
              Text(
                'Performance Analysis',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          QResultsAnalysisRow(
            label: 'Your Score',
            value: '$percentage%',
            color: isPassed ? Colors.green : Colors.orange,
          ),
          SizedBox(height: 10.h),
          QResultsAnalysisRow(
            label: 'Passing Score',
            value: '$passingMarks%',
            color: Colors.blue,
          ),
          SizedBox(height: 10.h),
          QResultsAnalysisRow(
            label: 'Difference',
            value: '${(percentage - passingMarks).abs()}%',
            color: Colors.grey,
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isPassed
                  ? Colors.green.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  isPassed ? Icons.lightbulb_outline : Icons.info_outline,
                  size: 18.sp,
                  color: isPassed ? Colors.green[700] : Colors.blue[700],
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    isPassed
                        ? 'Excellent work! Keep up the good performance.'
                        : 'Review the material and try again to improve your score.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[800],
                      height: 1.4,
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
