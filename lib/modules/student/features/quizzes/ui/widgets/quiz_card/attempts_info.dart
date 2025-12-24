import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';

class AttemptsInfo extends StatelessWidget {
  const AttemptsInfo({
    super.key,
    required this.attemptsUsed,
    required this.attemptsAllowed,
  });
  final int attemptsUsed;
  final int attemptsAllowed;
  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primary200.withAlpha(25),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.replay_outlined, size: 14.sp, color: AppColors.primary200),
          SizedBox(width: 6.w),
          Text(
            '$attemptsUsed/$attemptsAllowed ${tr('student_quizzes.quiz_card.attempts')}',
            style: AppTextStyles.font13Regular.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary300,
            ),
          ),
        ],
      ),
    );
  }
}
