import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/themes/custom_colors.dart';
import 'package:zrc/core/utils/spacing.dart';

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
            color: customColors.onContainerPrimary,
          ),
        ),
        verticalSpacing(12),
        Text(
          'Master Flutter development from scratch with hands-on projects. Learn widgets, state management, API integration, and build production-ready applications.',
          style: AppTextStyles.font14Regular.copyWith(
            color: customColors.onContainerSecondary,
          ),
        ),
      ],
    );
  }
}
