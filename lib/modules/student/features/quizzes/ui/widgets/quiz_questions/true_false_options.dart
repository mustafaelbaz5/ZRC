import 'package:flutter/material.dart';
import '../../../../../../../core/utils/spacing.dart';
import 'true_false_card.dart';

class TrueFalseOptions extends StatelessWidget {
  final dynamic selectedAnswer;
  final Function(String) onSelect;

  const TrueFalseOptions({
    super.key,
    required this.selectedAnswer,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TrueFalseCard(
            label: 'True',
            icon: Icons.check_circle,
            color: Colors.green,
            isSelected: selectedAnswer == 'True',
            onTap: () => onSelect('True'),
          ),
        ),
        horizontalSpacing(12),
        Expanded(
          child: TrueFalseCard(
            label: 'False',
            icon: Icons.cancel,
            color: Colors.red,
            isSelected: selectedAnswer == 'False',
            onTap: () => onSelect('False'),
          ),
        ),
      ],
    );
  }
}
