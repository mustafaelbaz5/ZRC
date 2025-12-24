import 'package:flutter/material.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/spacing.dart';

class StatisticsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const StatisticsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withAlpha((0.5 * 255).toInt()),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.transparent
                : AppColors.grey900.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: AppTextStyles.font14Regular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Icon + Value
          Row(
            children: [
              Container(
                width: responsiveWidth(56),
                height: responsiveHeight(56),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: responsiveFontSize(26),
                ),
              ),
              horizontalSpacing(12),
              Text(value, style: AppTextStyles.font20Bold),
            ],
          ),
        ],
      ),
    );
  }
}
