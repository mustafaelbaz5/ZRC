import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class DescriptionCard extends StatelessWidget {
  final QuizModel quiz;

  const DescriptionCard({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
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
                Icons.description_outlined,
                size: 20.sp,
                color: Colors.blue[700],
              ),
              horizontalSpacing(8),
              Text(
                tr('student_quizzes.quiz_detailed.description'),
                style: AppTextStyles.font16Bold,
              ),
            ],
          ),
          verticalSpacing(12),
          Text(
            quiz.description,
            style: AppTextStyles.font13Regular.copyWith(
              color: AppColors.grey300,
            ),
          ),
        ],
      ),
    );
  }
}
