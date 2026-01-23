import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class QuizDetailedInstructorCard extends StatelessWidget {
  final QuizModel quiz;

  const QuizDetailedInstructorCard({super.key, required this.quiz});

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
            color: context.customColors.divider.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.primary50,
            child: quiz.instructorAvatar != null
                ? null
                : Icon(Icons.person, size: 28.sp, color: AppColors.primary400),
          ),
          horizontalSpacing(responsiveWidth(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr('student_quizzes.quiz_detailed.instructor'),
                  style: AppTextStyles.font13Regular.copyWith(
                    color: context.customColors.textSecondary,
                  ),
                ),
                verticalSpacing(4),
                Text(quiz.instructorName, style: AppTextStyles.font16Bold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
