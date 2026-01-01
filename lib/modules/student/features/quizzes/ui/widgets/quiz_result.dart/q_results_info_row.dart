import 'package:flutter/material.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class QResultsInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const QResultsInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '$label: ',
          style: AppTextStyles.font13Bold.copyWith(
            color: context.customColors.textPrimary,
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.font13Regular.copyWith(
              color: context.customColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
