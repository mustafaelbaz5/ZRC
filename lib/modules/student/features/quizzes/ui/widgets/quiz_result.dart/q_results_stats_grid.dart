import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import 'q_results_stat_item.dart';

class QResultsStatsGrid extends StatelessWidget {
  final QuizModel quiz;
  final int percentage;

  const QResultsStatsGrid({
    super.key,
    required this.quiz,
    required this.percentage,
  });

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: <Widget>[
          Expanded(
            child: QResultsStatItem(
              icon: Icons.help_outline_rounded,
              label: tr('student_quizzes.quiz_result.stats.questions'),
              value: '${quiz.questionsCount}',
              color: Colors.purple,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: QResultsStatItem(
              icon: Icons.timer_outlined,
              label: tr('student_quizzes.quiz_result.stats.duration'),
              value: '${quiz.duration}m',
              color: Colors.blue,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: QResultsStatItem(
              icon: Icons.trending_up,
              label: tr('student_quizzes.quiz_result.stats.grade'),
              value: _getGrade(percentage),
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  String _getGrade(final int percentage) {
    if (percentage >= 90) return 'A+';
    if (percentage >= 80) return 'A';
    if (percentage >= 70) return 'B';
    if (percentage >= 60) return 'C';
    return 'F';
  }
}
