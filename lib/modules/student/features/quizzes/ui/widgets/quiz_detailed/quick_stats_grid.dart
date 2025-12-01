import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/stat_card.dart';

class QuickStatsGrid extends StatelessWidget {
  final QuizModel quiz;

  const QuickStatsGrid({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: StatCard(
              icon: Icons.help_outline_rounded,
              value: '${quiz.questionsCount}',
              label: 'Questions',
              color: Colors.purple,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.timer_outlined,
              value: '${quiz.duration}',
              label: 'Minutes',
              color: Colors.orange,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.grade_outlined,
              value: '${quiz.totalMarks}',
              label: 'Marks',
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
