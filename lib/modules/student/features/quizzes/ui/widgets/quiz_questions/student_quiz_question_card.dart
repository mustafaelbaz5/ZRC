import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_questions_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/question_type_chip.dart';

class StudentQuizQuestionCard extends StatelessWidget {
  final QuizQuestionsModel question;
  const StudentQuizQuestionCard({super.key, required this.question});

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.all(responsiveWidth(20)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow1Color.withAlpha((0.04 * 255).toInt()),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(12),
                  vertical: responsiveHeight(6),
                ),
                decoration: BoxDecoration(
                  color: context.customColors.onContainerPrimary.withAlpha(
                    (0.01 * 255).toInt(),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${question.marks} ${tr('student_quizzes.quiz_questions.question.marks')}',
                  style: AppTextStyles.font14Bold.copyWith(
                    color: context.customColors.onContainerPrimary,
                  ),
                ),
              ),
              const Spacer(),
              QuestionTypeChip(type: question.type),
            ],
          ),
          verticalSpacing(16),
          Text(question.text, style: AppTextStyles.font18Bold),
        ],
      ),
    );
  }
}
