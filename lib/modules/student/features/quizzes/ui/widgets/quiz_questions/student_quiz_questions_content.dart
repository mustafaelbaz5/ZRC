import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_questions_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/questions_answer/questions_answer_widget.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/student_quiz_question_card.dart';

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
