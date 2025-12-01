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
    final args = (settings.arguments as Map<String, dynamic>?) ?? {};

    switch (settings.name) {
      // ----------------- ONBOARDING -----------------
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      // ----------------- INITIAL / AUTH -----------------
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
            create: (_) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );

      // ----------------- STUDENT APP -----------------
      case Routes.studentScaffold:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.studentScaffold),
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
          builder: (_) => QuizDetailedScreen(quiz: args['quiz'] as QuizModel),
        );

      case Routes.studentQuizQuestionScreen:
        return MaterialPageRoute(
          builder: (_) => QuizQuestionsScreen(quiz: args['quiz'] as QuizModel),
        );

      case Routes.studentQuizResultScreen:
        return MaterialPageRoute(
          builder: (_) => QuizResultScreen(
            quiz: args['quiz'] as QuizModel,
            score: args['score'] as int,
          ),
        );

      case Routes.studentProfileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      // ----------------- INSTRUCTOR -----------------
      case Routes.instructorHomeScreen:
        return MaterialPageRoute(builder: (_) => const InstructorHomeScreen());

      // ----------------- ADMIN -----------------
      case Routes.adminHomeScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      // ----------------- DEFAULT -----------------
      default:
        return null;
    }
  }
}
