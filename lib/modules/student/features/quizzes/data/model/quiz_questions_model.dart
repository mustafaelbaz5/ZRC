enum QuestionType { mcq, trueFalse, fillInBlank }

class QuizQuestionsModel {
  final String id;
  final String text;
  final QuestionType type;
  final List<String>? options;
  final String correctAnswer;
  final int marks;

  QuizQuestionsModel({
    required this.id,
    required this.text,
    required this.type,
    this.options,
    required this.correctAnswer,
    required this.marks,
  });
}
