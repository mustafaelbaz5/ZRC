import 'package:flutter/material.dart';
import '../../../data/model/quiz_questions_model.dart';
import 'fill_in_blank_input.dart';
import 'm_c_q_options.dart';
import 'true_false_options.dart';

class QuestionsAnswerWidget extends StatelessWidget {
  final QuizQuestionsModel question;
  final dynamic selectedAnswer;
  final Function(dynamic) onSelect;

  const QuestionsAnswerWidget({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onSelect,
  });

  @override
  Widget build(final BuildContext context) {
    switch (question.type) {
      case QuestionType.mcq:
        return MCQOptions(
          options: question.options!,
          selectedAnswer: selectedAnswer,
          onSelect: onSelect,
        );
      case QuestionType.trueFalse:
        return TrueFalseOptions(
          selectedAnswer: selectedAnswer,
          onSelect: onSelect,
        );
      case QuestionType.fillInBlank:
        return FillInBlankInput(answer: selectedAnswer, onChanged: onSelect);
    }
  }
}
