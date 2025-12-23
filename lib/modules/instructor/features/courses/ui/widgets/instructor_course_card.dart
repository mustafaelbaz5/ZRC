import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/date_formate.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/features/courses/data/models/instructor_course_model.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/courses_tab_view/course_card_footer.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/courses_tab_view/course_card_thumbnail.dart';

class InstructorCourseCard extends StatelessWidget {
  const InstructorCourseCard({super.key, required this.course});

  final InstructorCourseModel course;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final canEdit =
        course.status == CourseStatus.draft ||
        course.status == CourseStatus.rejected;

    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: colors.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => context.pushNamed(
          Routes.instructorCoursePreviewScreen,
          arguments: {'course': course},
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail with overlay elements
            CourseCardThumbnail(course: course),

            // Content
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: AppTextStyles.font18Bold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(10),

                  // Category chip
                  Chip(
                    label: Text(course.category),
                    avatar: const Icon(Icons.category_rounded, size: 12),
                    backgroundColor: colors.border,
                    labelStyle: AppTextStyles.font13Bold,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                  ),

                  verticalSpacing(14),

                  // Stats
                  Row(
                    children: [
                      _Stat(
                        icon: Icons.people_rounded,
                        value: '${course.studentsEnrolled}',
                        color: colors.accentBlue,
                      ),
                      horizontalSpacing(16),
                      _Stat(
                        icon: Icons.visibility_rounded,
                        value: '${course.totalViews}',
                        color: colors.textSecondary,
                      ),
                      const Spacer(),
                      Text(
                        formatSmart(course.updatedAt),
                        style: AppTextStyles.font13Bold.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),

                  verticalSpacing(18),

                  // Action Buttons
                  CourseCardFooter(
                    canEdit: canEdit,
                    colors: colors,
                    course: course,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.value, required this.color});
  final IconData icon;
  final String value;
  final Color color;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        horizontalSpacing(6),
        Text(value, style: AppTextStyles.font14Bold),
      ],
    );
  }
}
