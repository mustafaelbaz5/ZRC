import 'package:flutter/material.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';

class QResultsAnalysisRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const QResultsAnalysisRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: AppTextStyles.font13Regular.copyWith(
            color: context.customColors.textPrimary,
          ),
        ),
        Text(value, style: AppTextStyles.font16Bold.copyWith(color: color)),
      ],
    );
  }
}
