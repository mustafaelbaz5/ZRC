import 'package:flutter/material.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/questions_answer/q_answers_option_card.dart';

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
  Widget build(final BuildContext context) {
    return Column(
      children: options
          .map(
            (final String option) => QAnswersOptionCard(
              option: option,
              isSelected: selectedAnswer == option,
              onTap: () => onSelect(option),
            ),
          )
          .toList(),
    );
  }
}
