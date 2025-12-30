import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/modules/instructor/features/courses/logic/cubit/instructor_courses_cubit.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../../../../../core/widgets/app_dialog/app_dialogs.dart';

class CourseCardFooter extends StatelessWidget {
  const CourseCardFooter({
    super.key,
    required this.canEdit,
    required this.course,
  });

  final bool canEdit;
  final CourseModel course;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Edit Button (only for editable courses)
        if (canEdit)
          _FooterButton(
            text: tr('instructor_courses.course_card.edit', context: context),
            icon: Icons.edit_rounded,
            backgroundColor: colors.surfaceVariant2,
            onPressed: () => context.pushNamed(
              Routes.addEditCourseScreen,
              arguments: {'course': course},
            ),
          ),
        if (canEdit) horizontalSpacing(10),

        // Preview / View Details Button
        _FooterButton(
          text: canEdit
              ? tr('instructor_courses.course_card.preview', context: context)
              : tr(
                  'instructor_courses.course_card.view_details',
                  context: context,
                ),
          icon: Icons.visibility_rounded,
          backgroundColor: colors.surfaceVariant2,
          onPressed: () => context.pushNamed(
            Routes.instructorCoursePreviewScreen,
            arguments: {'course': course},
          ),
        ),

        // Delete Button (only for draft courses)
        if (course.status == CourseStatus.draft) ...[
          horizontalSpacing(10),
          Container(
            decoration: BoxDecoration(
              color: colors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.delete_rounded),
              color: AppColors.error100,
              onPressed: () => AppDialogs.showConfirmation(
                context: context,
                title: tr(
                  'instructor_courses.course_card.delete_course',
                  context: context,
                ),
                message: tr(
                  'instructor_courses.course_card.delete_course_message',
                  context: context,
                ),
                onConfirm: () async {
                  await context.read<InstructorCoursesCubit>().deleteCourse(
                    courseId: course.id,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        tr(
                          'instructor_courses.course_card.deleted',
                          context: context,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// Reusable button widget
class _FooterButton extends StatelessWidget {
  const _FooterButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 40,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 16, color: Colors.white),
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
