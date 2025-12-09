import 'package:easy_localization/easy_localization.dart';
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
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TrueFalseCard(
            label: tr('student_quizzes.quiz_questions.true_false.true'),
            icon: Icons.check_circle,
            color: Colors.green,
            isSelected: selectedAnswer == 'True',
            onTap: () => onSelect('True'),
          ),
        ),
        horizontalSpacing(12),
        Expanded(
          child: TrueFalseCard(
            label: tr('student_quizzes.quiz_questions.true_false.false'),
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
