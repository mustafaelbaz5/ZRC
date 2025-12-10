import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/navigation.dart';
import '../../../../../../../core/router/routes.dart';
import '../../../data/model/quiz_model.dart';

class StartQuizButton extends StatelessWidget {
  final QuizModel quiz;

  const StartQuizButton({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    final bool canStart = quiz.attemptsUsed < quiz.attemptsAllowed;
    final String buttonText = quiz.attemptStatus == QuizAttemptStatus.completed
        ? tr('student_quizzes.quiz_detailed.retake_quiz')
        : quiz.attemptStatus == QuizAttemptStatus.inProgress
        ? tr('student_quizzes.quiz_detailed.continue_quiz')
        : tr('student_quizzes.quiz_detailed.start_quiz');

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        onPressed: canStart
            ? () {
                if (quiz.attemptStatus == QuizAttemptStatus.completed) {
                  context.pushReplacementNamed(
                    Routes.studentQuizQuestionScreen,
                    arguments: <String, Object>{'quiz': quiz, 'isRetake': true},
                  );
                } else if (quiz.attemptStatus == QuizAttemptStatus.inProgress) {
                  context.pushReplacementNamed(
                    Routes.studentQuizQuestionScreen,
                    arguments: <String, Object>{'quiz': quiz, 'isRetake': true},
                  );
                } else {
                  context.pushReplacementNamed(
                    Routes.studentQuizQuestionScreen,
                    arguments: <String, Object>{'quiz': quiz, 'isRetake': true},
                  );
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: canStart ? Colors.blue[700] : Colors.grey[400],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: canStart ? 6 : 0,
          shadowColor: Colors.blue.withAlpha((0.04 * 255).toInt()),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              canStart ? Icons.play_circle_filled : Icons.block,
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              canStart
                  ? buttonText
                  : tr('student_quizzes.quiz_detailed.no_attempts_left'),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
