import 'package:flutter/material.dart';

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
        Text('$label: ', style: AppTextStyles.font13BlueBold()),
        Expanded(child: Text(value, style: AppTextStyles.font13greyRegular())),
      ],
    );
  }
}
