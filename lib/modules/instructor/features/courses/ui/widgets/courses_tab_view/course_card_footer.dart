import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/themes/custom_colors.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/app_dialog/app_dialogs.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';
import 'package:zrc/modules/instructor/features/courses/data/models/instructor_course_model.dart';

class CourseCardFooter extends StatelessWidget {
  const CourseCardFooter({
    super.key,
    required this.canEdit,
    required this.colors,
    required this.course,
  });

  final bool canEdit;
  final CustomColors colors;
  final InstructorCourseModel course;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        if (canEdit)
          SizedBox(
            width: responsiveWidth(100),
            height: responsiveHeight(30),
            child: CustomTextButton(
              borderRadius: 10,
              verticalPadding: 8,
              horizontalPadding: 16,
              textStyle: AppTextStyles.font14Bold,
              backgroundColor: colors.surfaceVariant2,
              icon: const Icon(Icons.edit_rounded, size: 18),
              buttonText: "Edit",
              onPressed: () => context.pushNamed(
                Routes.addEditCourseScreen,
                arguments: {'course': course},
              ),
            ),
          ),
        if (canEdit) horizontalSpacing(10),
        SizedBox(
          width: canEdit ? responsiveWidth(120) : responsiveWidth(140),
          height: responsiveHeight(30),
          child: CustomTextButton(
            borderRadius: 10,
            verticalPadding: 8,
            textStyle: AppTextStyles.font13Bold,
            backgroundColor: colors.successContainer,
            icon: const Icon(Icons.visibility_rounded, size: 18),
            buttonText: canEdit ? 'Preview' : 'View Details',
            onPressed: () => context.pushNamed(
              Routes.instructorCoursePreviewScreen,
              arguments: {'course': course},
            ),
          ),
        ),

        if (course.status == CourseStatus.draft) ...[
          horizontalSpacing(10),
          IconButton(
            onPressed: () => AppDialogs.showConfirmation(
              context: context,
              title: 'Delete Course?',
              message: 'This action cannot be undone.',
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

            tooltip: 'Delete course',
          ),
        ],
      ],
    );
  }
}
