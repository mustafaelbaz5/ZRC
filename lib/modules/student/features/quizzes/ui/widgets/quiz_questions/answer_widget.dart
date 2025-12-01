import 'package:flutter/material.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_questions_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/fill_in_blank_input.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/m_c_q_options.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/true_false_options.dart';

class AnswerWidget extends StatelessWidget {
  final QuizQuestionsModel question;
  final dynamic selectedAnswer;
  final Function(dynamic) onSelect;

  const AnswerWidget({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
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
