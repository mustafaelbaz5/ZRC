import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/functions/date_formate.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import 'detail_row.dart';

class QuizzesDetailsInfo extends StatelessWidget {
  final QuizModel quiz;

  const QuizzesDetailsInfo({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      padding: EdgeInsets.all(responsiveWidth(20)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.border.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('student_quizzes.quiz_detailed.quiz_information'),
            style: AppTextStyles.font16Bold,
          ),
          verticalSpacing(16),
          DetailRow(
            icon: Icons.event_outlined,
            label: tr('student_quizzes.quiz_detailed.due_date'),
            value: formatFull(quiz.dueDate),
            color: _getDueDateColor(quiz.dueDate),
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.published_with_changes_outlined,
            label: tr('student_quizzes.quiz_detailed.published'),
            value: formatFull(quiz.publishedDate),
            color: AppColors.grey500,
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.trending_up,
            label: tr('student_quizzes.quiz_detailed.difficulty'),
            value: quiz.difficulty.name.toUpperCase(),
            color: _getDifficultyColor(quiz.difficulty),
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.replay_outlined,
            label: tr('student_quizzes.quiz_detailed.attempts'),
            value: '${quiz.attemptsUsed}/${quiz.attemptsAllowed}',
            color: AppColors.primary400,
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.check_circle_outline,
            label: tr('student_quizzes.quiz_detailed.passing_score'),
            value: '${quiz.passingMarks}%',
            color: AppColors.success200,
          ),
        ],
      ),
    );
  }

  Color _getDueDateColor(final DateTime dueDate) {
    final int difference = dueDate.difference(DateTime.now()).inDays;
    if (difference <= 1) return AppColors.error200;
    if (difference <= 3) return AppColors.warning200;
    return AppColors.grey500;
  }

  Color _getDifficultyColor(final QuizDifficulty difficulty) {
    switch (difficulty) {
      case QuizDifficulty.easy:
        return AppColors.success200;
      case QuizDifficulty.medium:
        return AppColors.warning200;
      case QuizDifficulty.hard:
        return AppColors.error200;
    }
  }
}
