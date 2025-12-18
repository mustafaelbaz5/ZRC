import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/themes/custom_colors.dart';
import 'package:zrc/core/utils/spacing.dart';

class CourseStats extends StatelessWidget {
  final CustomColors customColors;
  const CourseStats({super.key, required this.customColors});

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        _StatChip(
          customColors: customColors,
          icon: Icons.star_rounded,
          label: '4.8',
          iconColor: AppColors.warning100,
        ),
        horizontalSpacing(12),
        _StatChip(
          customColors: customColors,
          icon: Icons.people_outline_rounded,
          label: '2.5K',
          iconColor: AppColors.primary100,
        ),
        horizontalSpacing(12),
        _StatChip(
          customColors: customColors,
          icon: Icons.access_time_rounded,
          label: '12h',
          iconColor: AppColors.success100,
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final CustomColors customColors;
  final IconData icon;
  final String label;
  final Color iconColor;

  const _StatChip({
    required this.customColors,
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(12),
        vertical: responsiveHeight(8),
      ),
      decoration: BoxDecoration(
        color: customColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: customColors.border.withAlpha(128)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: iconColor),
          horizontalSpacing(6),
          Text(label, style: AppTextStyles.font13Regular),
        ],
      ),
    );
  }
}
