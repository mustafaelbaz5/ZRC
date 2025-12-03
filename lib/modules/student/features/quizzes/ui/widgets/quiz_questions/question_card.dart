import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_questions_model.dart';
import 'question_type_chip.dart';

class QuestionCard extends StatelessWidget {
  final QuizQuestionsModel question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.blue.withAlpha((0.01 * 255).toInt()),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${question.marks} marks',
                  style: AppTextStyles.font13BlueBold(),
                ),
              ),
              const Spacer(),
              QuestionTypeChip(type: question.type),
            ],
          ),
          verticalSpacing(16),
          Text(question.text, style: AppTextStyles.font16BlackBold()),
        ],
      ),
    );
  }
}
