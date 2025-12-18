import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class CourseTitleSection extends StatelessWidget {
  const CourseTitleSection({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Complete Course 2024',
          style: AppTextStyles.font24Bold.copyWith(
            color: context.customColors.textPrimary,
          ),
        ),
        verticalSpacing(16),
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=Ahmed+Mohamed&size=64',
              ),
            ),
            horizontalSpacing(10),
            Text(
              'Dr. Ahmed Mohamed',
              style: AppTextStyles.font14Bold.copyWith(
                color: context.customColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
