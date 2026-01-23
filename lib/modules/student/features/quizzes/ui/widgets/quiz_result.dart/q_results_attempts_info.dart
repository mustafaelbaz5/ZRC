import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_colors.dart';

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
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: canRetake
                  ? context.customColors.successContainer.withAlpha(
                      (0.1 * 255).toInt(),
                    )
                  : context.customColors.errorContainer.withAlpha(
                      (0.1 * 255).toInt(),
                    ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.replay_outlined,
              size: 24.sp,
              color: canRetake
                  ? context.customColors.successContainer
                  : context.customColors.errorContainer,
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr('student_quizzes.quiz_result.attempts.attempts_used'),
                  style: AppTextStyles.font13Regular.copyWith(
                    color: context.customColors.textSecondary,
                  ),
                ),
                verticalSpacing(8),
                Text(
                  '$attemptsUsed / $attemptsAllowed',
                  style: AppTextStyles.font16Bold,
                ),
              ],
            ),
          ),
          if (canRetake)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: context.customColors.successContainer.withAlpha(
                  (0.5 * 255).toInt(),
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                tr('student_quizzes.quiz_result.attempts.retake_available'),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: context.customColors.successContainer,
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(12),
                vertical: responsiveHeight(6),
              ),
              decoration: BoxDecoration(
                color: AppColors.error50.withAlpha((0.5 * 255).toInt()),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                tr('student_quizzes.quiz_result.attempts.no_attempts_left'),
                style: AppTextStyles.font13Bold.copyWith(
                  color: context.customColors.errorContainer,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
