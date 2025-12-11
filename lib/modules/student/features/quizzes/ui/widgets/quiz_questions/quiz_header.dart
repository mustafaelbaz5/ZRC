import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class QuizHeader extends StatelessWidget {
  final String remainingTime;
  final double progress;
  final int questionNumber;
  final int totalQuestions;
  final VoidCallback onExit;

  const QuizHeader({
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
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
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
                icon: Icon(Icons.close, color: Colors.grey[700]),
              ),
              const Spacer(),
              // Timer
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isLowTime
                      ? Colors.red.withAlpha((0.01 * 255).toInt())
                      : Colors.blue.withAlpha((0.01 * 255).toInt()),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isLowTime ? Colors.red : Colors.blue,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer_outlined,
                      size: 20.sp,
                      color: isLowTime ? Colors.red[700] : Colors.blue[700],
                    ),
                    horizontalSpacing(8),
                    Text(
                      remainingTime,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: isLowTime ? Colors.red[700] : Colors.blue[700],
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
                      color: AppColors.grey300,
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
                      color: AppColors.primary300,
                    ),
                  ),
                ],
              ),
              verticalSpacing(8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8.h,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
