// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/navigation.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_questions_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/answer_widget.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/exit_dialog.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/navigation_buttons.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/question_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/quiz_header.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/submit_dialog.dart';

class QuizQuestionsScreen extends StatefulWidget {
  final QuizModel quiz;

  const QuizQuestionsScreen({super.key, required this.quiz});

  @override
  State<QuizQuestionsScreen> createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
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
    _startTimer();
    _loadQuestions();
  }

  void _loadQuestions() {
    // Sample questions - replace with actual data
    questions = [
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

  String _formatTime(int seconds) {
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

  void _selectAnswer(dynamic answer) {
    setState(() => answers[currentQuestionIndex] = answer);
  }

  Future<void> _submitQuiz() async {
    if (_isSubmitting) return;

    final shouldSubmit = await showDialog<bool>(
      context: context,
      builder: (context) =>
          SubmitDialog(answered: answers.length, total: questions.length),
    );

    if (shouldSubmit == true) {
      setState(() => _isSubmitting = true);
      _timer.cancel();

      int score = _calculateScore();
      context.pushReplacementNamed(
        Routes.studentQuizResultScreen,
        arguments: {'quiz': widget.quiz, 'score': score},
      );
    }
  }

  int _calculateScore() {
    int totalScore = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers.containsKey(i) &&
          answers[i].toString().toLowerCase() ==
              questions[i].correctAnswer.toLowerCase()) {
        totalScore += questions[i].marks;
      }
    }
    return totalScore;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            title: Text(
              tr('student_quizzes.quiz_questions.exit_dialog.title'),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            content: Text(
              tr('student_quizzes.quiz_questions.exit_dialog.message'),
              style: TextStyle(fontSize: 14.sp),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  tr('student_quizzes.quiz_questions.exit_dialog.cancel'),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  tr('student_quizzes.quiz_questions.exit_dialog.exit'),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        );

        if (shouldExit == true) {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: Column(
            children: [
              QuizHeader(
                remainingTime: _formatTime(_remainingSeconds),
                progress: progress,
                questionNumber: currentQuestionIndex + 1,
                totalQuestions: questions.length,
                onExit: () async {
                  final shouldExit = await showDialog<bool>(
                    context: context,
                    builder: (_) => const ExitDialog(),
                  );
                  if (shouldExit == true) Navigator.pop(context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QuestionCard(question: currentQuestion),
                      verticalSpacing(24),
                      AnswerWidget(
                        question: currentQuestion,
                        selectedAnswer: answers[currentQuestionIndex],
                        onSelect: _selectAnswer,
                      ),
                    ],
                  ),
                ),
              ),
              NavigationButtons(
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
