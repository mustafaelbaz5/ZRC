class QuizModel {
  final String id;
  final String title;
  final String subject;
  final String description;
  final String instructorName;
  final String? instructorAvatar;
  final int questionsCount;
  final int duration;
  final int totalMarks;
  final int passingMarks;
  final DateTime dueDate;
  final DateTime publishedDate;
  final QuizAttemptStatus attemptStatus;
  final int? userScore;
  final int attemptsAllowed;
  final int attemptsUsed;
  final QuizDifficulty difficulty;

  QuizModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.instructorName,
    this.instructorAvatar,
    required this.questionsCount,
    required this.duration,
    required this.totalMarks,
    required this.passingMarks,
    required this.dueDate,
    required this.publishedDate,
    required this.attemptStatus,
    this.userScore,
    required this.attemptsAllowed,
    required this.attemptsUsed,
    required this.difficulty,
  });
}

enum QuizAttemptStatus { notStarted, inProgress, completed }

enum QuizDifficulty { easy, medium, hard }
