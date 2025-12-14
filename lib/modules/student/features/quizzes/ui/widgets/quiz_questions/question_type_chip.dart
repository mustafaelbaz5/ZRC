import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_questions_model.dart';

class QuestionTypeChip extends StatelessWidget {
  final QuestionType type;

  const QuestionTypeChip({super.key, required this.type});

  @override
  Widget build(final BuildContext context) {
    String label;
    IconData icon;
    Color color;

    switch (type) {
      case QuestionType.mcq:
        label = tr('student_quizzes.quiz_questions.question_types.mcq');
        icon = Icons.list_alt;
        color = context.customColors.onContainerSecondary;
        break;
      case QuestionType.trueFalse:
        label = tr('student_quizzes.quiz_questions.question_types.true_false');
        icon = Icons.check_circle_outline;
        color = AppColors.success200;
        break;
      case QuestionType.fillInBlank:
        label = tr(
          'student_quizzes.quiz_questions.question_types.fill_in_blank',
        );
        icon = Icons.edit_outlined;
        color = AppColors.warning200;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(10),
        vertical: responsiveHeight(6),
      ),
      decoration: BoxDecoration(
        color: color.withAlpha((0.04 * 255).toInt()),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 14.sp, color: color),
          horizontalSpacing(12),
          Text(label, style: AppTextStyles.font13Bold.copyWith(color: color)),
        ],
      ),
    );
  }
}
