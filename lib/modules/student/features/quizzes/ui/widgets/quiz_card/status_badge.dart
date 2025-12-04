import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/quiz_model.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.score});
  final QuizAttemptStatus status;
  final int? score;
  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String label;
    IconData icon;

    switch (status) {
      case QuizAttemptStatus.completed:
        bgColor = Colors.green.withOpacity(0.12);
        textColor = Colors.green[700]!;
        label = score != null
            ? '$score%'
            : tr('student_quizzes.status.completed');
        icon = Icons.check_circle;
        break;
      case QuizAttemptStatus.inProgress:
        bgColor = Colors.orange.withOpacity(0.12);
        textColor = Colors.orange[700]!;
        label = tr('student_quizzes.status.in_progress');
        icon = Icons.access_time;
        break;
      case QuizAttemptStatus.notStarted:
        bgColor = Colors.blue.withOpacity(0.12);
        textColor = Colors.blue[700]!;
        label = tr('student_quizzes.status.not_started');
        icon = Icons.play_circle_outline;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sp, color: textColor),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
