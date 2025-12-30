import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/models/course_model.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class CoursesEmptyState extends StatelessWidget {
  const CoursesEmptyState({super.key, required this.status});

  final CourseStatus status;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final config = _getEmptyStateConfig(status);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(responsiveHeight(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: Icon(
                config.icon,
                size: responsiveFontSize(48),
                color: colors.textSecondary,
              ),
            ),
            verticalSpacing(20),
            Text(
              config.title,
              style: AppTextStyles.font20Bold.copyWith(
                color: colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(12),
            Text(
              config.subtitle,
              style: AppTextStyles.font14Regular.copyWith(
                color: colors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  ({IconData icon, String title, String subtitle}) _getEmptyStateConfig(
    final CourseStatus status,
  ) {
    return switch (status) {
      CourseStatus.draft => (
        icon: Icons.edit_note_rounded,
        title: 'instructor_courses.empty_state.title_drafts'.tr(),
        subtitle: 'instructor_courses.empty_state.subtitle_drafts'.tr(),
      ),
      CourseStatus.pending => (
        icon: Icons.schedule_rounded,
        title: 'instructor_courses.empty_state.title_pending'.tr(),
        subtitle: 'instructor_courses.empty_state.subtitle_pending'.tr(),
      ),
      CourseStatus.published => (
        icon: Icons.rocket_launch_rounded,
        title: 'instructor_courses.empty_state.title_published'.tr(),
        subtitle: 'instructor_courses.empty_state.subtitle_published'.tr(),
      ),
      CourseStatus.rejected => (
        icon: Icons.cancel_rounded,
        title: 'instructor_courses.empty_state.title_rejected'.tr(),
        subtitle: 'instructor_courses.empty_state.subtitle_rejected'.tr(),
      ),
    };
  }
}
