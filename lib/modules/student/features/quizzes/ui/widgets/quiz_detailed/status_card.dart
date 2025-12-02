import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';

class StatusCard extends StatelessWidget {
  final QuizModel quiz;

  const StatusCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final isCompleted = quiz.attemptStatus == QuizAttemptStatus.completed;
    final canRetake = quiz.attemptsUsed < quiz.attemptsAllowed;

    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isCompleted
              ? [Colors.green[400]!, Colors.green[600]!]
              : [Colors.orange[400]!, Colors.orange[600]!],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: (isCompleted ? Colors.green : Colors.orange).withAlpha(
              (0.04 * 255).toInt(),
            ),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            isCompleted
                ? Icons.check_circle_rounded
                : Icons.access_time_rounded,
            size: 48.sp,
            color: Colors.white,
          ),
          SizedBox(height: 12.h),
          Text(
            isCompleted ? 'Quiz Completed!' : 'Quiz Pending',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          if (isCompleted && quiz.userScore != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha((0.04 * 255).toInt()),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'Your Score: ${quiz.userScore}%',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          if (isCompleted && canRetake)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                'You can retake this quiz',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white.withAlpha((0.04 * 255).toInt()),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
