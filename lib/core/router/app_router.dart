import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/modules/student/features/quizzes/ui/quiz_result_screen.dart';
import '../../modules/student/features/quizzes/data/model/quiz_model.dart';
import '../../modules/student/features/quizzes/ui/quiz_detailed_screen.dart';
import '../../modules/student/features/quizzes/ui/quiz_questions_screen.dart';
import '../auth/ui/widgets/initial_screen.dart';
import '../../modules/admin/features/dashboard/ui/dashboard_screen.dart';
import '../../modules/instructor/features/home/ui/instructor_home_screen.dart';
import '../../modules/student/features/courses/ui/courses_details_screen.dart';

import '../../modules/student/core/widgets/student_scaffold.dart';
import '../../modules/student/features/courses/ui/courses_screen.dart';
import '../../modules/student/features/home/ui/home_screen.dart';
import '../../modules/student/features/quizzes/ui/quizzes_screen.dart';
import '../../modules/student/features/profile/ui/profile_screen.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../auth/ui/login_screen.dart';
import '../onboarding/ui/on_boarding_screen.dart';
import 'routes.dart';

final navigationKey = GlobalKey<CurvedNavigationBarState>();

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.initialScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit()..checkAutoLogin(),
            child: const InitialScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );
      // Student module
      case Routes.studentScaffold:
        return MaterialPageRoute(
          builder: (_) => StudentScaffold(navigationKey: navigationKey),
        );

      case Routes.studentHomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.studentCoursesScreen:
        return MaterialPageRoute(builder: (_) => const CoursesScreen());

      case Routes.studentCoursesDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CoursesDetailsScreen());

      case Routes.studentQuizzesScreen:
        return MaterialPageRoute(builder: (_) => const QuizzesScreen());

      case Routes.studentQuizDetailedScreen:
        return MaterialPageRoute(
          builder: (_) => QuizDetailedScreen(
            quiz: QuizModel(
              id: 'quiz_001',
              title: 'Mathematics Chapter 5 Quiz',
              subject: 'Mathematics',
              description:
                  'This quiz covers algebraic equations, quadratic formulas, and problem-solving techniques from Chapter 5.',
              instructorName: 'Dr. Ahmed Hassan',
              instructorAvatar: null,
              questionsCount: 20,
              duration: 45,
              totalMarks: 100,
              passingMarks: 60,
              dueDate: DateTime.now().add(const Duration(days: 5)),
              publishedDate: DateTime.now().subtract(const Duration(days: 2)),
              attemptStatus: QuizAttemptStatus.notStarted,
              userScore: null,
              attemptsAllowed: 2,
              attemptsUsed: 0,
              difficulty: QuizDifficulty.medium,
            ),
          ),
        );

      case Routes.studentQuizQuestionScreen:
        return MaterialPageRoute(
          builder: (_) => QuizQuestionsScreen(
            quiz: QuizModel(
              id: 'quiz_001',
              title: 'Mathematics Chapter 5 Quiz',
              subject: 'Mathematics',
              description:
                  'This quiz covers algebraic equations, quadratic formulas, and problem-solving techniques from Chapter 5.',
              instructorName: 'Dr. Ahmed Hassan',
              instructorAvatar: null,
              questionsCount: 20,
              duration: 10,
              totalMarks: 100,
              passingMarks: 60,
              dueDate: DateTime.now().add(const Duration(days: 5)),
              publishedDate: DateTime.now().subtract(const Duration(days: 2)),
              attemptStatus: QuizAttemptStatus.notStarted,
              userScore: null,
              attemptsAllowed: 2,
              attemptsUsed: 0,
              difficulty: QuizDifficulty.medium,
            ),
          ),
        );
      case Routes.studentQuizResultScreen:
        return MaterialPageRoute(builder: (_) => const QuizResultScreen());
      case Routes.studentProfileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      //Instructor module
      case Routes.instructorHomeScreen:
        return MaterialPageRoute(builder: (_) => const InstructorHomeScreen());

      // Admin module
      case Routes.adminHomeScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      default:
        return null;
    }
  }
}
