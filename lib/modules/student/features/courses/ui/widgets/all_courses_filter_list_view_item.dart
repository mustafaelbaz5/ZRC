import 'package:flutter/material.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_text_styles.dart';

class AllCoursesFilterListViewItem extends StatelessWidget {
  const AllCoursesFilterListViewItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: isSelected
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.lightBlue : Colors.grey.shade300,
                width: 1.5,
              ),
              color: isSelected ? Colors.white : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.lightBlue.withAlpha(20),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Text(
              title,
              textAlign: TextAlign.center, // center below the icon
              style: AppTextStyles.font14BlackRegular(),
            ),
          ),
        ],
      ),
    );
  }
}
