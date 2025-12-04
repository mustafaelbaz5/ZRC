import 'package:flutter/material.dart';

import 'option_card.dart';

class MCQOptions extends StatelessWidget {
  final List<String> options;
  final dynamic selectedAnswer;
  final Function(String) onSelect;

  const MCQOptions({
    super.key,
    required this.options,
    required this.selectedAnswer,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => OptionCard(
              option: option,
              isSelected: selectedAnswer == option,
              onTap: () => onSelect(option),
            ),
          )
          .toList(),
    );
  }
}
