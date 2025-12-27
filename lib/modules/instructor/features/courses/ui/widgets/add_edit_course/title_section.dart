import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../../../../../core/widgets/custom_text_form_.dart';
import 'section_label.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: 'instructor_course_create.course_title'.tr(),
          icon: Icons.title_rounded,
        ),
        verticalSpacing(12),
        CustomTextFormField(
          controller: controller,
          hintText: 'instructor_course_create.course_title_hint'.tr(),
          style: CustomTextFieldStyle.outlined,
          validator: (final v) => v?.trim().isEmpty == true
              ? 'instructor_course_create.validation.required'.tr()
              : null,
        ),
      ],
    );
  }
}
