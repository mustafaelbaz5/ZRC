import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/quiz_model.dart';
import 'quiz_card/quiz_card.dart';

class QuizzesListView extends StatelessWidget {
  final String filter;

  const QuizzesListView({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final allQuizzes = List.generate(
      10,
      (index) => QuizModel(
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
    final filteredQuizzes = allQuizzes.where((quiz) {
      if (filter == 'Pending') {
        return quiz.attemptStatus != QuizAttemptStatus.completed;
      } else if (filter == 'Completed') {
        return quiz.attemptStatus == QuizAttemptStatus.completed;
      }
      return true;
    }).toList();

    if (filteredQuizzes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_outlined, size: 64.sp, color: Colors.grey[400]),
            SizedBox(height: 16.h),
            Text(
              'No quizzes found',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Check back later for new quizzes',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: filteredQuizzes.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return QuizCard(quiz: filteredQuizzes[index]);
      },
    );
  }
}
