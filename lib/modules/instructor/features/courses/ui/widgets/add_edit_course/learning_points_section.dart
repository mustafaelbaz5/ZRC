import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../../../../../core/widgets/custom_text_form_.dart';
import 'section_label.dart';

class LearningPointsSection extends StatelessWidget {
  const LearningPointsSection({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: 'instructor_course_create.learning_points'.tr(),
          icon: Icons.checklist_rounded,
          isOptional: true,
        ),
        verticalSpacing(12),
        CustomTextFormField(
          controller: controller,
          hintText: 'instructor_course_create.learning_points_hint'.tr(),
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          style: CustomTextFieldStyle.outlined,
        ),
        verticalSpacing(10),
        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: responsiveRadius(16),
              color: context.customColors.textSecondary,
            ),
            horizontalSpacing(8),
            Expanded(
              child: Text(
                'instructor_course_create.learning_points_help'.tr(),
                style: AppTextStyles.font13Regular.copyWith(
                  color: context.customColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
