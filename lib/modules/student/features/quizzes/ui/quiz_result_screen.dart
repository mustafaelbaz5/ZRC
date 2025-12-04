import 'package:flutter/material.dart';
import '../../../../../core/utils/spacing.dart';
import '../data/model/quiz_model.dart';
import 'widgets/quiz_result.dart/q_result_result_header.dart';

import 'widgets/quiz_result.dart/q_results_action_buttons.dart';

import 'widgets/quiz_result.dart/q_results_attempts_info.dart';
import 'widgets/quiz_result.dart/q_results_performance_analysis.dart';
import 'widgets/quiz_result.dart/q_results_quiz_info_card.dart';
import 'widgets/quiz_result.dart/q_results_score_card.dart';
import 'widgets/quiz_result.dart/q_results_stats_grid.dart';

class QuizResultScreen extends StatelessWidget {
  final QuizModel quiz;
  final int score;

  const QuizResultScreen({super.key, required this.quiz, required this.score});

  @override
  Widget build(BuildContext context) {
    final percentage = (score / quiz.totalMarks * 100).round();
    final isPassed = percentage >= quiz.passingMarks;
    final canRetake = quiz.attemptsUsed < quiz.attemptsAllowed;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
