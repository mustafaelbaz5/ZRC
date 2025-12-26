import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_form_.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/category_suggestions.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/section_label.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: 'instructor_course_create.category'.tr(),
          icon: Icons.category_rounded,
        ),
        verticalSpacing(12),
        CustomTextFormField(
          controller: controller,
          hintText: 'instructor_course_create.category_hint'.tr(),
          prefixIcon: const Icon(Icons.category_outlined),
          style: CustomTextFieldStyle.outlined,
          validator: (final v) => v?.trim().isEmpty == true
              ? 'instructor_course_create.validation.required'.tr()
              : null,
        ),
        verticalSpacing(12),
        CategorySuggestions(
          onCategorySelected: (final cat) => controller.text = cat,
        ),
      ],
    );
  }
}
