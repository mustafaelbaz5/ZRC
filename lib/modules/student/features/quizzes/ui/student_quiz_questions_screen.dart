import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_questions_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/answer_widget.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/exit_dialog.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/navigation_buttons.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/question_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/quiz_header.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_questions/submit_dialog.dart';

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
  Map<int, dynamic> answers = <int, dynamic>{};
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
    questions = <QuizQuestionsModel>[
      QuizQuestionsModel(
        id: '1',
        text: 'What is the capital of France?',
        type: QuestionType.mcq,
        options: <String>['London', 'Paris', 'Berlin', 'Madrid'],
        correctAnswer: 'Paris',
        marks: 5,
      ),
      QuizQuestionsModel(
        id: '2',
        text: 'The Earth is flat.',
        type: QuestionType.trueFalse,
        options: <String>['True', 'False'],
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
        options: <String>['Venus', 'Mars', 'Jupiter', 'Saturn'],
        correctAnswer: 'Mars',
        marks: 5,
      ),
      QuizQuestionsModel(
        id: '5',
        text: 'Water boils at 100°C at sea level.',
        type: QuestionType.trueFalse,
        options: <String>['True', 'False'],
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
    final int minutes = seconds ~/ 60;
    final int secs = seconds % 60;
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

    final bool? shouldSubmit = await showDialog<bool>(
      context: context,
      builder: (final BuildContext context) =>
          SubmitDialog(answered: answers.length, total: questions.length),
    );

    if (shouldSubmit == true) {
      setState(() => _isSubmitting = true);
      _timer.cancel();

      final int score = _calculateScore();
      context.pushReplacementNamed(
        Routes.studentQuizResultScreen,
        arguments: <String, Object>{'quiz': widget.quiz, 'score': score},
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
  Widget build(final BuildContext context) {
    final QuizQuestionsModel currentQuestion = questions[currentQuestionIndex];
    final double progress = (currentQuestionIndex + 1) / questions.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (final bool didPop, final Object? result) async {
        if (didPop) return;

        final bool? shouldExit = await showDialog<bool>(
          context: context,
          builder: (final BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            title: Text(
              tr('student_quizzes.quiz_questions.exit_dialog.title'),
              style: AppTextStyles.font18Bold,
            ),
            content: Text(
              tr('student_quizzes.quiz_questions.exit_dialog.message'),
              style: AppTextStyles.font14Regular,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  tr('student_quizzes.quiz_questions.exit_dialog.cancel'),
                  style: AppTextStyles.font14Regular,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  tr('student_quizzes.quiz_questions.exit_dialog.exit'),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.grey0,
                  ),
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              QuizHeader(
                remainingTime: _formatTime(_remainingSeconds),
                progress: progress,
                questionNumber: currentQuestionIndex + 1,
                totalQuestions: questions.length,
                onExit: () async {
                  final bool? shouldExit = await showDialog<bool>(
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
                    children: <Widget>[
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
