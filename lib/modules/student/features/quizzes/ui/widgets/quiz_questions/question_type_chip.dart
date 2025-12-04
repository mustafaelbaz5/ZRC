import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_questions_model.dart';

class QuestionTypeChip extends StatelessWidget {
  final QuestionType type;

  const QuestionTypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    String label;
    IconData icon;
    Color color;

    switch (type) {
      case QuestionType.mcq:
        label = tr('student_quizzes.quiz_questions.question_types.mcq');
        icon = Icons.list_alt;
        color = Colors.purple;
        break;
      case QuestionType.trueFalse:
        label = tr('student_quizzes.quiz_questions.question_types.true_false');
        icon = Icons.check_circle_outline;
        color = Colors.teal;
        break;
      case QuestionType.fillInBlank:
        label = tr(
          'student_quizzes.quiz_questions.question_types.fill_in_blank',
        );
        icon = Icons.edit_outlined;
        color = Colors.orange;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withAlpha((0.04 * 255).toInt()),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          horizontalSpacing(12),
          Text(
            label,
            style: AppTextStyles.font13BlueBold().copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
