import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';

import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({super.key, required this.difficulty});
  final QuizDifficulty difficulty;
  @override
  Widget build(final BuildContext context) {
    Color color;
    String label;

    switch (difficulty) {
      case QuizDifficulty.easy:
        color = AppColors.success200;
        label = tr('student_quizzes.difficulty.easy');
        break;
      case QuizDifficulty.medium:
        color = AppColors.warning200;
        label = tr('student_quizzes.difficulty.medium');
        break;
      case QuizDifficulty.hard:
        color = AppColors.error200;
        label = tr('student_quizzes.difficulty.hard');
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(8),
        vertical: responsiveHeight(4),
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withAlpha(20), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            difficulty == QuizDifficulty.hard
                ? Icons.local_fire_department
                : difficulty == QuizDifficulty.medium
                ? Icons.trending_up
                : Icons.wb_sunny_outlined,
            size: 16.sp,
            color: color,
          ),
          horizontalSpacing(4),
          Text(label, style: AppTextStyles.font13Bold.copyWith(color: color)),
        ],
      ),
    );
  }
}
