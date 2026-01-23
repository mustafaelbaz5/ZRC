import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/themes/custom_colors.dart';
import '../../../../../../../core/utils/spacing.dart';

class CourseDescription extends StatelessWidget {
  final CustomColors customColors;
  const CourseDescription({super.key, required this.customColors});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('student_courses.sections.about'),
          style: AppTextStyles.font20Bold.copyWith(
            color: customColors.textPrimary,
          ),
        ),
        verticalSpacing(12),
        Text(
          'Master Flutter development from scratch with hands-on projects. Learn widgets, state management, API integration, and build production-ready applications.',
          style: AppTextStyles.font14Regular.copyWith(
            color: customColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
