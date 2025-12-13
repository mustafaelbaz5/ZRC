import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class StartCourseButton extends StatelessWidget {
  final VoidCallback onTap;
  const StartCourseButton({super.key, required this.onTap});

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        shadowColor: context.customColors.borderColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: responsiveHeight(56),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_circle_filled,
                  color: AppColors.primary0,
                  size: responsiveWidth(26),
                ),
                horizontalSpacing(10),
                Text(
                  'Start Course',
                  style: AppTextStyles.font20Bold.copyWith(
                    color: AppColors.primary0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
