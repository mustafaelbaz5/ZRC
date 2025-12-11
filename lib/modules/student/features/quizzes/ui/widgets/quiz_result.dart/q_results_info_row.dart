import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';

class QResultsInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const QResultsInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label: ',
          style: AppTextStyles.font13Bold.copyWith(color: AppColors.primary300),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.font13Regular.copyWith(
              color: AppColors.grey300,
            ),
          ),
        ),
      ],
    );
  }
}
