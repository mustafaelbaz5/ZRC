import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../../../../../core/widgets/app_dialog/app_dialogs.dart';
import '../../../../../../../core/widgets/custom_text_button.dart';
import '../../../data/models/instructor_course_model.dart';

class CourseCardFooter extends StatelessWidget {
  const CourseCardFooter({
    super.key,
    required this.canEdit,
    required this.course,
  });

  final bool canEdit;
  final InstructorCourseModel course;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        if (canEdit)
          SizedBox(
            width: responsiveWidth(100),
            height: responsiveHeight(40),
            child: CustomTextButton(
              size: CustomButtonSize.small,
              borderRadius: 10,
              textStyle: AppTextStyles.font14Bold,
              backgroundColor: context.customColors.surfaceVariant2,
              prefixIcon: const Icon(Icons.edit_rounded, size: 16),
              text: tr('instructor_courses.course_card.edit'),
              onPressed: () => context.pushNamed(
                Routes.addEditCourseScreen,
                arguments: {'course': course},
              ),
            ),
          ),
        if (canEdit) horizontalSpacing(10),
        SizedBox(
          width: canEdit ? responsiveWidth(120) : responsiveWidth(140),
          height: responsiveHeight(40),
          child: CustomTextButton(
            size: CustomButtonSize.small,
            borderRadius: 10,

            textStyle: AppTextStyles.font13Bold,
            backgroundColor: context.customColors.surfaceVariant2,
            prefixIcon: const Icon(Icons.visibility_rounded, size: 16),
            text: canEdit
                ? tr('instructor_courses.course_card.preview')
                : tr('instructor_courses.course_card.view_details'),
            onPressed: () => context.pushNamed(
              Routes.instructorCoursePreviewScreen,
              arguments: {'course': course},
            ),
          ),
        ),

        if (course.status == CourseStatus.draft) ...[
          horizontalSpacing(16),
          IconButton(
            onPressed: () => AppDialogs.showConfirmation(
              context: context,
              title: tr('instructor_courses.course_card.delete_course'),
              message: tr(
                'instructor_courses.course_card.delete_course_message',
              ),
              onConfirm: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Course deleted')));
              },
              onCancel: () => Navigator.pop(context),
            ),
            icon: const Icon(Icons.delete_rounded, color: Colors.red),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                context.customColors.surfaceVariant,
              ),
              iconColor: const WidgetStatePropertyAll(Colors.red),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),

            tooltip: tr('instructor_courses.course_card.delete_course'),
          ),
        ],
      ],
    );
  }
}
