import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_card/student_quiz_card.dart';

class StudentQuizzesListView extends StatelessWidget {
  final String filter;

  const StudentQuizzesListView({super.key, required this.filter});

  @override
  Widget build(final BuildContext context) {
    final List<QuizModel> allQuizzes = List.generate(
      10,
      (final int index) => QuizModel(
        id: 'quiz_$index',
        title: "Quiz ${index + 1}: Chapter ${index + 1}",
        subject: index % 2 == 0 ? "Mathematics" : "Physics",
        description:
            "This quiz covers the key concepts from chapter ${index + 1}",
        instructorName: "Dr. Ahmed Hassan",
        instructorAvatar: null,
        questionsCount: 15 + (index * 2),
        duration: 30 + (index * 5),
        totalMarks: 30,
        passingMarks: 15,
        dueDate: DateTime.now().add(Duration(days: index + 2)),
        publishedDate: DateTime.now().subtract(const Duration(days: 2)),
        attemptStatus: index % 4 == 0
            ? QuizAttemptStatus.completed
            : index % 4 == 1
            ? QuizAttemptStatus.inProgress
            : QuizAttemptStatus.notStarted,
        userScore: index % 4 == 0 ? 85 + index : null,
        attemptsAllowed: 1,
        attemptsUsed: index % 4 == 0 ? 1 : 0,
        difficulty: index % 3 == 0
            ? QuizDifficulty.hard
            : index % 3 == 1
            ? QuizDifficulty.medium
            : QuizDifficulty.easy,
      ),
    );

    // Filter quizzes
    final List<QuizModel> filteredQuizzes = allQuizzes.where((
      final QuizModel quiz,
    ) {
      if (filter == tr('student_quizzes.filters.pending')) {
        return quiz.attemptStatus != QuizAttemptStatus.completed;
      } else if (filter == tr('student_quizzes.filters.completed')) {
        return quiz.attemptStatus == QuizAttemptStatus.completed;
      }
      return true;
    }).toList();

    if (filteredQuizzes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.quiz_outlined,
              size: 64.sp,
              color: context.customColors.onContainerSecondary,
            ),
            verticalSpacing(16),
            Text(
              tr('student_quizzes.empty_state.title'),
              style: AppTextStyles.font16Bold.copyWith(
                color: context.customColors.onContainerSecondary,
              ),
            ),
            verticalSpacing(8),
            Text(
              tr('student_quizzes.empty_state.subtitle'),
              style: AppTextStyles.font14Regular.copyWith(
                color: context.customColors.onContainerSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(8),
      ),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: filteredQuizzes.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (final BuildContext context, final int index) =>
          verticalSpacing(16),
      itemBuilder: (final BuildContext context, final int index) {
        return StudentQuizCard(quiz: filteredQuizzes[index]);
      },
    );
  }
}
