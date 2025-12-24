import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class QResultsStatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const QResultsStatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: responsiveHeight(16)),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(responsiveWidth(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow1Color.withAlpha((0.04 * 255).toInt()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 24.sp, color: color),
          verticalSpacing(8),
          Text(value, style: AppTextStyles.font16Bold),
          verticalSpacing(4),
          Text(
            label,
            style: AppTextStyles.font13Regular.copyWith(color: AppColors.grey0),
          ),
        ],
      ),
    );
  }
}
