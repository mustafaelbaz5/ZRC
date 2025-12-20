import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/widgets/app_dialog/app_dialogs.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_questions_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/quiz_questions_header.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/student_quiz_navigation_buttons.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/student_quiz_questions_content.dart';

class StudentQuizQuestionsScreen extends StatefulWidget {
  final QuizModel quiz;
  const StudentQuizQuestionsScreen({super.key, required this.quiz});

  @override
  State<StudentQuizQuestionsScreen> createState() =>
      _StudentQuizQuestionsScreenState();
}

class _StudentQuizQuestionsScreenState
    extends State<StudentQuizQuestionsScreen> {
  int currentQuestionIndex = 0;
  Map<int, dynamic> answers = {};
  late Timer _timer;
  late int _remainingSeconds;
  bool _isSubmitting = false;
  late List<QuizQuestionsModel> questions;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.quiz.duration * 60;
    _loadQuestions();
    _startTimer();
  }

  void _loadQuestions() {
    // Replace with real data
    questions = <QuizQuestionsModel>[
      QuizQuestionsModel(
        id: '1',
        text: 'What is the capital of France?',
        type: QuestionType.mcq,
        options: ['London', 'Paris', 'Berlin', 'Madrid'],
        correctAnswer: 'Paris',
        marks: 5,
      ),
      QuizQuestionsModel(
        id: '2',
        text: 'The Earth is flat.',
        type: QuestionType.trueFalse,
        options: ['True', 'False'],
        correctAnswer: 'False',
        marks: 3,
      ),
      QuizQuestionsModel(
        id: '3',
        text: 'What is the result of 2 + 2?',
        type: QuestionType.fillInBlank,
        correctAnswer: '4',
        marks: 4,
      ),
      QuizQuestionsModel(
        id: '4',
        text: 'Which planet is known as the Red Planet?',
        type: QuestionType.mcq,
        options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        correctAnswer: 'Mars',
        marks: 5,
      ),
      QuizQuestionsModel(
        id: '5',
        text: 'Water boils at 100°C at sea level.',
        type: QuestionType.trueFalse,
        options: ['True', 'False'],
        correctAnswer: 'True',
        marks: 3,
      ),
    ];
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _submitQuiz();
      }
    });
  }

  String _formatTime(final int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() => currentQuestionIndex++);
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() => currentQuestionIndex--);
    }
  }

  void _selectAnswer(final dynamic answer) {
    setState(() => answers[currentQuestionIndex] = answer);
  }

  Future<void> _submitQuiz() async {
    if (_isSubmitting) return;

    final shouldSubmit = await AppDialogs.showConfirmation(
      context: context,
      title: 'Submit Quiz',
      message: 'Are you sure you want to submit the quiz?',
      confirmText: 'Submit',
      cancelText: 'Cancel',
      onConfirm: () {},
      onCancel: () {},
    );

    if (shouldSubmit == true) {
      setState(() => _isSubmitting = true);
      _timer.cancel();

      final score = _calculateScore();
      context.pushReplacementNamed(
        Routes.studentQuizResultScreen,
        arguments: {'quiz': widget.quiz, 'score': score},
      );
    }
  }

  int _calculateScore() {
    int total = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers.containsKey(i) &&
          answers[i].toString().toLowerCase() ==
              questions[i].correctAnswer.toLowerCase()) {
        total += questions[i].marks;
      }
    }
    return total;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (final bool didPop, final dynamic result) async {
        if (didPop) return;
        final bool shouldExit =
            await AppDialogs.showConfirmation(
              context: context,
              title: 'Exit Quiz',
              message: 'Are you sure you want to exit the quiz?',
              onConfirm: () {},
              onCancel: () {},
            ) ??
            false;
        if (shouldExit && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              QuizQuestionsHeader(
                remainingTime: _formatTime(_remainingSeconds),
                progress: progress,
                questionNumber: currentQuestionIndex + 1,
                totalQuestions: questions.length,
                onExit: () async {
                  final shouldExit =
                      await AppDialogs.showConfirmation(
                        context: context,
                        title: 'Exit Quiz',
                        message: 'Are you sure you want to exit the quiz?',
                        onConfirm: () {},
                        onCancel: () {},
                      ) ??
                      false;
                  if (shouldExit && mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: StudentQuizQuestionsContent(
                    question: currentQuestion,
                    selectedAnswer: answers[currentQuestionIndex],
                    onSelectAnswer: _selectAnswer,
                  ),
                ),
              ),
              StudentQuizNavigationButtons(
                currentIndex: currentQuestionIndex,
                totalQuestions: questions.length,
                onPrevious: _previousQuestion,
                onNext: _nextQuestion,
                onSubmit: _submitQuiz,
                hasAnswer: answers.containsKey(currentQuestionIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
