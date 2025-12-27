import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_form_.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/section_label.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/thumbnail_preview.dart';

class YouTubeSection extends StatelessWidget {
  const YouTubeSection({
    super.key,
    required this.controller,
    required this.thumbnailUrl,
  });

  final TextEditingController controller;
  final String? thumbnailUrl;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: 'instructor_course_create.youtube_url'.tr(),
          icon: Icons.play_circle_outline_rounded,
        ),
        verticalSpacing(12),
        CustomTextFormField(
          controller: controller,
          hintText: 'https://youtube.com/watch?v=...',
          keyboardType: TextInputType.url,
          prefixIcon: const Icon(Icons.link_rounded),
          style: CustomTextFieldStyle.outlined,
          validator: (final value) {
            if (value == null || value.trim().isEmpty) {
              return 'instructor_course_create.validation.required'.tr();
            }
            if (!value.contains('youtube.com') && !value.contains('youtu.be')) {
              return 'instructor_course_create.validation.invalid_youtube_url'
                  .tr();
            }
            return null;
          },
        ),
        if (controller.text.trim().isNotEmpty && thumbnailUrl != null) ...[
          verticalSpacing(20),
          ThumbnailPreview(thumbnailUrl: thumbnailUrl!),
        ],
      ],
    );
  }
}
