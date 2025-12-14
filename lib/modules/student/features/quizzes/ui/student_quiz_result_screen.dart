import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_result_result_header.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_action_buttons.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_attempts_info.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_performance_analysis.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_quiz_info_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_score_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_stats_grid.dart';

class StudentQuizResultScreen extends StatelessWidget {
  final QuizModel quiz;
  final int score;

  const StudentQuizResultScreen({
    super.key,
    required this.quiz,
    required this.score,
  });

  @override
  Widget build(final BuildContext context) {
    final int percentage = (score / quiz.totalMarks * 100).round();
    final bool isPassed = percentage >= quiz.passingMarks;
    final bool canRetake = quiz.attemptsUsed < quiz.attemptsAllowed;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // Result Header
                      QResultResultHeader(
                        isPassed: isPassed,
                        percentage: percentage,
                      ),

                      // Score Card
                      QResultsScoreCard(
                        score: score,
                        totalMarks: quiz.totalMarks,
                        percentage: percentage,
                        isPassed: isPassed,
                      ),

                      // Stats Grid
                      QResultsStatsGrid(quiz: quiz, percentage: percentage),

                      // Performance Analysis
                      QResultsPerformanceAnalysis(
                        isPassed: isPassed,
                        percentage: percentage,
                        passingMarks: quiz.passingMarks,
                      ),

                      // Attempts Info
                      if (quiz.attemptsAllowed > 1)
                        QResultsAttemptsInfo(
                          attemptsUsed: quiz.attemptsUsed + 1,
                          attemptsAllowed: quiz.attemptsAllowed,
                          canRetake: canRetake,
                        ),

                      // Quiz Info
                      QResultsQuizInfoCard(quiz: quiz),

                      verticalSpacing(50),
                    ],
                  ),
                ),
              ),

              // Action Buttons
              QResultsActionButtons(
                isPassed: isPassed,
                canRetake: canRetake,
                quiz: quiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
