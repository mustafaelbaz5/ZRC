import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class StudentQuizNavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSubmit;
  final bool hasAnswer;

  const StudentQuizNavigationButtons({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onPrevious,
    required this.onNext,
    required this.onSubmit,
    required this.hasAnswer,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isLastQuestion = currentIndex == totalQuestions - 1;

    return Container(
      padding: EdgeInsets.all(responsiveHeight(16)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.divider.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          if (currentIndex > 0)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPrevious,
                icon: Icon(
                  Icons.arrow_back,
                  size: 18.sp,
                  color: context.customColors.textSecondary,
                ),
                label: Text(
                  tr('student_quizzes.quiz_questions.navigation.previous'),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: context.customColors.textSecondary,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: context.customColors.surface,
                  padding: EdgeInsets.symmetric(vertical: responsiveHeight(14)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(color: context.customColors.border),
                ),
              ),
            ),
          if (currentIndex > 0) horizontalSpacing(12),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: hasAnswer
                  ? (isLastQuestion ? onSubmit : onNext)
                  : null,
              icon: Icon(
                isLastQuestion ? Icons.check_circle : Icons.arrow_forward,
                size: 18.sp,
              ),
              label: Text(
                isLastQuestion
                    ? tr(
                        'student_quizzes.quiz_questions.navigation.submit_quiz',
                      )
                    : tr('student_quizzes.quiz_questions.navigation.next'),
                style: AppTextStyles.font18Regular.copyWith(
                  color: context.customColors.background,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isLastQuestion
                    ? AppColors.success200
                    : AppColors.openBlue700,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: responsiveHeight(14)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: hasAnswer ? 4 : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
