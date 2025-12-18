import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/spacing.dart';

import '../../../../../../../core/themes/app_text_styles.dart';

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
