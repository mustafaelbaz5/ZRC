import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';

class StartQuizButton extends StatelessWidget {
  final QuizModel quiz;

  const StartQuizButton({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final canStart = quiz.attemptsUsed < quiz.attemptsAllowed;
    final buttonText = quiz.attemptStatus == QuizAttemptStatus.completed
        ? 'Retake Quiz'
        : quiz.attemptStatus == QuizAttemptStatus.inProgress
        ? 'Continue Quiz'
        : 'Start Quiz';

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        onPressed: canStart
            ? () {
                // Navigate to quiz taking screen
                // Navigator.push(context, MaterialPageRoute(builder: (_) => QuizTakingScreen(quiz: quiz)));
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
          children: [
            Icon(
              canStart ? Icons.play_circle_filled : Icons.block,
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              canStart ? buttonText : 'No Attempts Left',
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
