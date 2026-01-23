import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import '../../../../../core/widgets/stat_card.dart';

class QuizDetailedQuickStatsGrid extends StatelessWidget {
  final QuizModel quiz;

  const QuizDetailedQuickStatsGrid({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: StatCard(
              icon: Icons.help_outline_rounded,
              value: '${quiz.questionsCount}',
              label: tr('student_quizzes.quiz_detailed.questions'),
              color: AppColors.primary200,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.timer_outlined,
              value: '${quiz.duration}',
              label: tr('student_quizzes.quiz_detailed.minutes'),
              color: AppColors.warning200,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.grade_outlined,
              value: '${quiz.totalMarks}',
              label: tr('student_quizzes.quiz_detailed.marks'),
              color: AppColors.success200,
            ),
          ),
        ],
      ),
    );
  }
}
