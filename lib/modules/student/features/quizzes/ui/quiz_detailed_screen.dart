import 'package:flutter/material.dart';
import '../../../../../core/utils/spacing.dart';
import '../data/model/quiz_model.dart';
import 'widgets/quiz_detailed/description_card.dart';
import 'widgets/quiz_detailed/instructor_card.dart';
import 'widgets/quiz_detailed/quick_stats_grid.dart';
import 'widgets/quiz_detailed/quiz_detailed_app_bar.dart';
import 'widgets/quiz_detailed/quizzes_details_filter_chip.dart';
import 'widgets/quiz_detailed/start_quiz_button.dart';
import 'widgets/quiz_detailed/status_card.dart';

class QuizDetailedScreen extends StatelessWidget {
  final QuizModel quiz;

  const QuizDetailedScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Gradient
          QuizDetailedAppBar(quiz: quiz),

          // body
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Status Card
                StatusCard(quiz: quiz),

                verticalSpacing(16),

                // Quick Stats
                QuickStatsGrid(quiz: quiz),

                verticalSpacing(16),

                // Description Card
                if (quiz.description.isNotEmpty) DescriptionCard(quiz: quiz),

                verticalSpacing(16),

                // Instructor Info Card
                InstructorCard(quiz: quiz),

                verticalSpacing(16),

                // Quiz Details Card
                QuizzesDetailsFilterChip(quiz: quiz),

                verticalSpacing(120),
              ],
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: StartQuizButton(quiz: quiz),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
