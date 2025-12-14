import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class FillInBlankInput extends StatelessWidget {
  final dynamic answer;
  final Function(String) onChanged;

  const FillInBlankInput({
    super.key,
    required this.answer,
    required this.onChanged,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.all(responsiveHeight(20)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow1Color.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('student_quizzes.quiz_questions.question.your_answer'),
            style: AppTextStyles.font14Bold.copyWith(
              color: context.customColors.onContainerPrimary,
            ),
          ),
          verticalSpacing(14),
          TextField(
            onChanged: onChanged,
            controller: TextEditingController(text: answer?.toString() ?? ''),
            decoration: InputDecoration(
              hintText: tr(
                'student_quizzes.quiz_questions.question.answer_hint',
              ),
              filled: true,
              fillColor: context.customColors.containerColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: context.customColors.borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: context.customColors.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.customColors.onContainerPrimary,
                  width: 2,
                ),
              ),
            ),
            style: AppTextStyles.font16Regular.copyWith(
              color: context.customColors.onContainerPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
