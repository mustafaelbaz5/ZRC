import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/features/courses/data/models/instructor_course_model.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/course_card.dart';

class CoursesTabView extends StatelessWidget {
  const CoursesTabView({super.key, required this.statuses});

  final List<CourseStatus> statuses;

  @override
  Widget build(final BuildContext context) {
    final filteredCourses = List<InstructorCourse>.empty(growable: true);

    if (filteredCourses.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(16),
      ),
      itemCount: filteredCourses.length,
      itemBuilder: (final context, final index) {
        final course = filteredCourses[index];
        return Padding(
          padding: EdgeInsets.only(bottom: responsiveHeight(16)),
          child: CourseCard(course: course),
        );
      },
    );
  }

  Widget _buildEmptyState(final BuildContext context) {
    final colors = context.customColors;
    final String message = switch (statuses.first) {
      CourseStatus.draft => 'instructor_courses.empty_state.title_drafts'.tr(),
      CourseStatus.pending =>
        'instructor_courses.empty_state.title_pending'.tr(),
      _ => 'instructor_courses.empty_state.title_published'.tr(),
    };

    return Center(
      child: Padding(
        padding: EdgeInsets.all(responsiveHeight(32)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: responsiveFontSize(60),
              color: colors.textSecondary,
            ),
            verticalSpacing(8),
            Text(
              message,
              style: AppTextStyles.font20Bold.copyWith(
                color: colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(8),
            Text(
              statuses.first == CourseStatus.draft
                  ? 'instructor_courses.empty_state.subtitle_drafts'.tr()
                  : 'instructor_courses.empty_state.subtitle_published'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
