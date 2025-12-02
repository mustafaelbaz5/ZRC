import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/date_formate.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/detail_row.dart';

class QuizzesDetailsFilterChip extends StatelessWidget {
  final QuizModel quiz;

  const QuizzesDetailsFilterChip({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quiz Information', style: AppTextStyles.font16BlackBold),
          verticalSpacing(16),
          DetailRow(
            icon: Icons.event_outlined,
            label: 'Due Date',
            value: formatFull(quiz.dueDate),
            color: _getDueDateColor(quiz.dueDate),
          ),
          SizedBox(height: 12.h),
          DetailRow(
            icon: Icons.published_with_changes_outlined,
            label: 'Published',
            value: formatFull(quiz.publishedDate),
            color: Colors.grey,
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.trending_up,
            label: 'Difficulty',
            value: quiz.difficulty.name.toUpperCase(),
            color: _getDifficultyColor(quiz.difficulty),
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.replay_outlined,
            label: 'Attempts',
            value: '${quiz.attemptsUsed}/${quiz.attemptsAllowed}',
            color: Colors.indigo,
          ),
          verticalSpacing(12),
          DetailRow(
            icon: Icons.check_circle_outline,
            label: 'Passing Score',
            value: '${quiz.passingMarks}%',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Color _getDueDateColor(DateTime dueDate) {
    final difference = dueDate.difference(DateTime.now()).inDays;
    if (difference <= 1) return Colors.red;
    if (difference <= 3) return Colors.orange;
    return Colors.grey;
  }

  Color _getDifficultyColor(QuizDifficulty difficulty) {
    switch (difficulty) {
      case QuizDifficulty.easy:
        return Colors.green;
      case QuizDifficulty.medium:
        return Colors.orange;
      case QuizDifficulty.hard:
        return Colors.red;
    }
  }
}
