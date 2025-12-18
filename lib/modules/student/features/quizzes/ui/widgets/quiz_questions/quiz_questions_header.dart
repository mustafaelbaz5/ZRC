import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class QuizQuestionsHeader extends StatelessWidget {
  final String remainingTime;
  final double progress;
  final int questionNumber;
  final int totalQuestions;
  final VoidCallback onExit;

  const QuizQuestionsHeader({
    super.key,
    required this.remainingTime,
    required this.progress,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onExit,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isLowTime = int.parse(remainingTime.split(':')[0]) < 5;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow1Color.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // Exit Button
              IconButton(
                onPressed: onExit,
                icon: Icon(
                  Icons.close,
                  color: context.customColors.textPrimary,
                ),
              ),
              const Spacer(),
              // Timer
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(16),
                  vertical: responsiveHeight(8),
                ),
                decoration: BoxDecoration(
                  color: isLowTime
                      ? AppColors.error200.withAlpha((0.01 * 255).toInt())
                      : context.customColors.textPrimary.withAlpha(
                          (0.01 * 255).toInt(),
                        ),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isLowTime
                        ? AppColors.error200
                        : context.customColors.textPrimary,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer_outlined,
                      size: 20.sp,
                      color: isLowTime
                          ? AppColors.error300
                          : context.customColors.textPrimary,
                    ),
                    horizontalSpacing(8),
                    Text(
                      remainingTime,
                      style: AppTextStyles.font16Bold.copyWith(
                        color: isLowTime
                            ? AppColors.error300
                            : context.customColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          // Progress Bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    tr(
                      'student_quizzes.quiz_questions.header.question_of',
                      namedArgs: <String, String>{
                        'current': questionNumber.toString(),
                        'total': totalQuestions.toString(),
                      },
                    ),
                    style: AppTextStyles.font16Regular.copyWith(
                      color: context.customColors.textPrimary,
                    ),
                  ),
                  Text(
                    tr(
                      'student_quizzes.quiz_questions.header.progress_percent',
                      namedArgs: <String, String>{
                        'percent': (progress * 100).toInt().toString(),
                      },
                    ),
                    style: AppTextStyles.font16Bold.copyWith(
                      color: context.customColors.textPrimary,
                    ),
                  ),
                ],
              ),
              verticalSpacing(8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: responsiveHeight(8),
                  backgroundColor: context.customColors.textSecondary,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.success100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
