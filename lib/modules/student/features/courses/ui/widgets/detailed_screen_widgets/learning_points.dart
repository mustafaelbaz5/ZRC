import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/themes/custom_colors.dart';
import 'package:zrc/core/utils/spacing.dart';

class LearningPoints extends StatelessWidget {
  final CustomColors customColors;
  const LearningPoints({super.key, required this.customColors});

  final List<String> points = const [
    'Build beautiful mobile apps with Flutter',
    'Master Dart programming language',
    'Implement state management solutions',
    'Deploy to App Store and Play Store',
  ];

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('student_courses.sections.what_you_learn'),
          style: AppTextStyles.font20Bold.copyWith(
            color: customColors.onContainerPrimary,
          ),
        ),
        verticalSpacing(12),
        ...points.map(
          (final point) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: responsiveWidth(20),
                  height: responsiveHeight(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
                horizontalSpacing(12),
                Expanded(
                  child: Text(
                    point,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: customColors.onContainerSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
