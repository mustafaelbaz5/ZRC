import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';

class ActiveQuizCard extends StatelessWidget {
  final String title;
  final int questionsCount;
  final String deadline;
  final VoidCallback onTap;

  const ActiveQuizCard({
    super.key,
    required this.title,
    required this.questionsCount,
    required this.deadline,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250, // fixed width for horizontal scrolling
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode
                  ? Colors.transparent
                  : AppColors.grey900.withOpacity(0.05),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.quiz, size: 40, color: context.customColors.textPrimary),
            const SizedBox(height: 12),
            Text(title, style: AppTextStyles.font16Bold),
            const SizedBox(height: 6),
            Text(
              "$questionsCount Questions",
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.grey500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Deadline: $deadline",
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.error300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
