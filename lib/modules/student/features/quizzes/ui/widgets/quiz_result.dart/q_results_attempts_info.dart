import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class QResultsAttemptsInfo extends StatelessWidget {
  final int attemptsUsed;
  final int attemptsAllowed;
  final bool canRetake;

  const QResultsAttemptsInfo({
    super.key,
    required this.attemptsUsed,
    required this.attemptsAllowed,
    required this.canRetake,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: canRetake
                  ? Colors.blue.withAlpha((0.1 * 255).toInt())
                  : Colors.red.withAlpha((0.1 * 255).toInt()),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.replay_outlined,
              size: 24.sp,
              color: canRetake ? Colors.blue[700] : Colors.red[700],
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('student_quizzes.quiz_result.attempts.attempts_used'),
                  style: AppTextStyles.font13greyRegular(),
                ),
                verticalSpacing(8),
                Text(
                  '$attemptsUsed / $attemptsAllowed',
                  style: AppTextStyles.font16BlackBold(),
                ),
              ],
            ),
          ),
          if (canRetake)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha((0.1 * 255).toInt()),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                tr('student_quizzes.quiz_result.attempts.retake_available'),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.green[700],
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha((0.1 * 255).toInt()),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                tr('student_quizzes.quiz_result.attempts.no_attempts_left'),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.red[700],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
