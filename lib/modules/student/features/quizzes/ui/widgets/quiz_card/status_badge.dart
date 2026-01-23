import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.score});
  final QuizAttemptStatus status;
  final int? score;
  @override
  Widget build(final BuildContext context) {
    Color bgColor;
    Color textColor;
    String label;
    IconData icon;

    switch (status) {
      case QuizAttemptStatus.completed:
        bgColor = context.customColors.successContainer;
        textColor = context.customColors.textPrimary;
        label = score != null
            ? '$score%'
            : tr('student_quizzes.status.completed');
        icon = Icons.check_circle;
        break;
      case QuizAttemptStatus.inProgress:
        bgColor = context.customColors.infoContainer;
        textColor = context.customColors.textPrimary;
        label = tr('student_quizzes.status.in_progress');
        icon = Icons.access_time;
        break;
      case QuizAttemptStatus.notStarted:
        bgColor = context.customColors.infoContainer;
        textColor = context.customColors.textPrimary;
        label = tr('student_quizzes.status.not_started');
        icon = Icons.play_circle_outline;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(12),
        vertical: responsiveHeight(6),
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 16.sp, color: textColor),
          horizontalSpacing(14),
          Text(
            label,
            style: AppTextStyles.font13Bold.copyWith(
              color: context.customColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
