import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({super.key, required this.difficulty});
  final QuizDifficulty difficulty;
  @override
  Widget build(final BuildContext context) {
    Color color;
    String label;

    switch (difficulty) {
      case QuizDifficulty.easy:
        color = Colors.green;
        label = tr('student_quizzes.difficulty.easy');
        break;
      case QuizDifficulty.medium:
        color = Colors.orange;
        label = tr('student_quizzes.difficulty.medium');
        break;
      case QuizDifficulty.hard:
        color = Colors.red;
        label = tr('student_quizzes.difficulty.hard');
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color..withAlpha(20), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            difficulty == QuizDifficulty.hard
                ? Icons.local_fire_department
                : difficulty == QuizDifficulty.medium
                ? Icons.trending_up
                : Icons.wb_sunny_outlined,
            size: 12.sp,
            color: color,
          ),
          horizontalSpacing(4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
