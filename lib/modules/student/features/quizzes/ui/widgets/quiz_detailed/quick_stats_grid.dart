import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import 'stat_card.dart';

class QuickStatsGrid extends StatelessWidget {
  final QuizModel quiz;

  const QuickStatsGrid({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: <Widget>[
          Expanded(
            child: StatCard(
              icon: Icons.help_outline_rounded,
              value: '${quiz.questionsCount}',
              label: tr('student_quizzes.quiz_detailed.questions'),
              color: Colors.purple,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.timer_outlined,
              value: '${quiz.duration}',
              label: tr('student_quizzes.quiz_detailed.minutes'),
              color: Colors.orange,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.grade_outlined,
              value: '${quiz.totalMarks}',
              label: tr('student_quizzes.quiz_detailed.marks'),
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
