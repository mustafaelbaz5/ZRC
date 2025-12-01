import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_stat_item.dart';

class QResultsStatsGrid extends StatelessWidget {
  final QuizModel quiz;
  final int percentage;

  const QResultsStatsGrid({
    super.key,
    required this.quiz,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: QResultsStatItem(
              icon: Icons.help_outline_rounded,
              label: 'Questions',
              value: '${quiz.questionsCount}',
              color: Colors.purple,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: QResultsStatItem(
              icon: Icons.timer_outlined,
              label: 'Duration',
              value: '${quiz.duration}m',
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: QResultsStatItem(
              icon: Icons.trending_up,
              label: 'Grade',
              value: _getGrade(percentage),
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  String _getGrade(int percentage) {
    if (percentage >= 90) return 'A+';
    if (percentage >= 80) return 'A';
    if (percentage >= 70) return 'B';
    if (percentage >= 60) return 'C';
    return 'F';
  }
}
