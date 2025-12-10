// ignore_for_file: always_specify_types
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/modules/instructor/core/widgets/instructor_scaffold.dart';
import 'package:zrc/modules/student/features/courses/ui/student_courses_details_screen.dart';
import 'package:zrc/modules/student/features/courses/ui/student_courses_screen.dart';
import 'package:zrc/modules/student/features/profile/ui/student_profile_screen.dart';
import 'package:zrc/modules/student/features/quizzes/ui/student_quiz_detailed_screen.dart';
import 'package:zrc/modules/student/features/quizzes/ui/student_quiz_questions_screen.dart';
import 'package:zrc/modules/student/features/quizzes/ui/student_quiz_result_screen.dart';
import 'package:zrc/modules/student/features/quizzes/ui/student_quizzes_screen.dart';

import '../../modules/admin/features/dashboard/ui/dashboard_screen.dart';
import '../../modules/instructor/features/home/ui/instructor_home_screen.dart';
import '../../modules/student/core/widgets/student_scaffold.dart';
import '../../modules/student/features/home/ui/student_home_screen.dart';
import '../../modules/student/features/quizzes/data/model/quiz_model.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../auth/ui/login_screen.dart';
import '../auth/ui/widgets/initial_screen.dart';
import '../onboarding/ui/on_boarding_screen.dart';
import 'routes.dart';

final GlobalKey<CurvedNavigationBarState> navigationKey =
    GlobalKey<CurvedNavigationBarState>();

class AppRouter {
  Route<dynamic>? generateRoute(final RouteSettings settings) {
    final Map<String, dynamic> args =
        (settings.arguments as Map<String, dynamic>?) ?? <String, dynamic>{};

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
        final GlobalKey<CurvedNavigationBarState> key =
            (settings.arguments as Map<String, dynamic>?)?['navigationKey']
                as GlobalKey<CurvedNavigationBarState>? ??
            GlobalKey<CurvedNavigationBarState>();

        return MaterialPageRoute(
          builder: (_) => StudentScaffold(navigationKey: key),
        );

      case Routes.studentHomeScreen:
        return MaterialPageRoute(builder: (_) => const StudentHomeScreen());

      case Routes.studentCoursesScreen:
        return MaterialPageRoute(builder: (_) => const StudentCoursesScreen());

      case Routes.studentCoursesDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const StudentCoursesDetailsScreen(),
        );

      case Routes.studentQuizzesScreen:
        return MaterialPageRoute(builder: (_) => const StudentQuizzesScreen());

      case Routes.studentQuizDetailedScreen:
        return MaterialPageRoute(
          builder: (_) =>
              StudentQuizDetailedScreen(quiz: args['quiz'] as QuizModel),
        );

      case Routes.studentQuizQuestionScreen:
        return MaterialPageRoute(
          builder: (_) =>
              StudentQuizQuestionsScreen(quiz: args['quiz'] as QuizModel),
        );

      case Routes.studentQuizResultScreen:
        return MaterialPageRoute(
          builder: (_) => StudentQuizResultScreen(
            quiz: args['quiz'] as QuizModel,
            score: args['score'] as int,
          ),
        );

      case Routes.studentProfileScreen:
        return MaterialPageRoute(builder: (_) => const StudentProfileScreen());

      // ----------------- INSTRUCTOR -----------------
      case Routes.instructorScaffold:
        final GlobalKey<CurvedNavigationBarState> instructorKey =
            args['navigationKey'] as GlobalKey<CurvedNavigationBarState>? ??
            GlobalKey<CurvedNavigationBarState>();

        return MaterialPageRoute(
          builder: (_) => InstructorScaffold(navigationKey: instructorKey),
        );

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
