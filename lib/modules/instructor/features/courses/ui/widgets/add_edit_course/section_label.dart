import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    super.key,
    required this.label,
    required this.icon,
    this.isOptional = false,
  });

  final String label;
  final IconData icon;
  final bool isOptional;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    return Row(
      children: [
        Icon(icon, size: responsiveRadius(22), color: colors.accentBlue),
        horizontalSpacing(12),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.font16Bold.copyWith(color: colors.textPrimary),
          ),
        ),
        if (isOptional)
          Text(
            'instructor_course_create.is_optional'.tr(),
            style: AppTextStyles.font13Regular.copyWith(
              color: colors.textSecondary,
            ),
          ),
      ],
    );
  }
}
