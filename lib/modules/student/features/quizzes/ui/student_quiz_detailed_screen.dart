import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/quiz_detailed_app_bar.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/quiz_detailed_description_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/quiz_detailed_instructor_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/quiz_detailed_quick_stats_grid.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/quiz_detailed_status_card.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/quizzes_details_info.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/start_quiz_button.dart';

class StudentQuizDetailedScreen extends StatelessWidget {
  final QuizModel quiz;

  const StudentQuizDetailedScreen({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          // Custom App Bar with Gradient
          QuizDetailedAppBar(quiz: quiz),

          // body
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                // Status Card
                QuizDetailedStatusCard(quiz: quiz),

                verticalSpacing(16),

                // Quick Stats
                QuizDetailedQuickStatsGrid(quiz: quiz),

                verticalSpacing(16),

                // Description Card
                if (quiz.description.isNotEmpty)
                  QuizDetailedDescriptionCard(quiz: quiz),

                verticalSpacing(16),

                // Instructor Info Card
                QuizDetailedInstructorCard(quiz: quiz),

                verticalSpacing(16),

                // Quiz Details Card
                QuizzesDetailsInfo(quiz: quiz),

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
