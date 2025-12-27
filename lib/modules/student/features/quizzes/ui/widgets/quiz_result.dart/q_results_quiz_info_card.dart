import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import 'q_results_info_row.dart';

class QResultsQuizInfoCard extends StatelessWidget {
  final QuizModel quiz;

  const QResultsQuizInfoCard({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.all(responsiveWidth(16)),
      padding: EdgeInsets.all(responsiveWidth(20)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.background.withAlpha(
              (0.04 * 255).toInt(),
            ),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.quiz_outlined,
                size: 20.sp,
                color: context.customColors.textPrimary,
              ),
              horizontalSpacing(8),
              Text(
                tr('student_quizzes.quiz_result.quiz_info.title'),
                style: AppTextStyles.font16Bold,
              ),
            ],
          ),
          verticalSpacing(16),
          QResultsInfoRow(
            label: tr('student_quizzes.quiz_result.quiz_info.quiz_title'),
            value: quiz.title,
          ),
          verticalSpacing(8),
          QResultsInfoRow(
            label: tr('student_quizzes.quiz_result.quiz_info.subject'),
            value: quiz.subject,
          ),
          verticalSpacing(8),
          QResultsInfoRow(
            label: tr('student_quizzes.quiz_result.quiz_info.instructor'),
            value: quiz.instructorName,
          ),
        ],
      ),
    );
  }
}
