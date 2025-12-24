import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: color.withAlpha((0.01 * 255).toInt()),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 20.sp, color: color),
        ),
        horizontalSpacing(12),
        Expanded(child: Text(label, style: AppTextStyles.font16Regular)),
        Text(
          value,
          style: AppTextStyles.font13Regular.copyWith(
            color: context.customColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
