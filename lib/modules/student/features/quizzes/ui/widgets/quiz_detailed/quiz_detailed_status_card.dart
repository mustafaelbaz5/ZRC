import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class QuizDetailedStatusCard extends StatelessWidget {
  final QuizModel quiz;

  const QuizDetailedStatusCard({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    final bool isCompleted = quiz.attemptStatus == QuizAttemptStatus.completed;
    final bool canRetake = quiz.attemptsUsed < quiz.attemptsAllowed;

    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isCompleted
              ? <Color>[AppColors.success200, AppColors.success300]
              : <Color>[AppColors.warning200, AppColors.warning300],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: (isCompleted ? AppColors.success200 : AppColors.warning200)
                .withAlpha((0.04 * 255).toInt()),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(
            isCompleted
                ? Icons.check_circle_rounded
                : Icons.access_time_rounded,
            size: 48.sp,
            color: AppColors.grey0,
          ),
          verticalSpacing(24),
          Text(
            isCompleted
                ? tr('student_quizzes.quiz_detailed.quiz_completed')
                : tr('student_quizzes.quiz_detailed.quiz_pending'),
            style: AppTextStyles.font20Bold.copyWith(color: AppColors.grey0),
          ),
          verticalSpacing(8),
          if (isCompleted && quiz.userScore != null)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(20),
                vertical: responsiveHeight(8),
              ),
              decoration: BoxDecoration(
                color: AppColors.grey0.withAlpha((0.04 * 255).toInt()),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                tr(
                  'student_quizzes.quiz_detailed.your_score',
                  namedArgs: <String, String>{
                    'score': quiz.userScore.toString(),
                  },
                ),
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.grey0,
                ),
              ),
            ),
          if (isCompleted && canRetake)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                tr('student_quizzes.quiz_detailed.can_retake'),
                style: AppTextStyles.font13Regular.copyWith(
                  color: AppColors.grey0.withAlpha((0.7 * 255).toInt()),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
