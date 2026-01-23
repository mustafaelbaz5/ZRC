import 'package:flutter/material.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_questions_model.dart';
import '../questions_answer/questions_answer_widget.dart';
import 'student_quiz_question_card.dart';

class StudentQuizQuestionsContent extends StatelessWidget {
  const StudentQuizQuestionsContent({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onSelectAnswer,
  });

  final QuizQuestionsModel question;
  final dynamic selectedAnswer;
  final ValueChanged<dynamic> onSelectAnswer;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StudentQuizQuestionCard(question: question),
        verticalSpacing(24),
        QuestionsAnswerWidget(
          question: question,
          selectedAnswer: selectedAnswer,
          onSelect: onSelectAnswer,
        ),
      ],
    );
  }
}
