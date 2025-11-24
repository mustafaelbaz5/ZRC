import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/auth/ui/widgets/initial_screen.dart';
import 'package:zrc/modules/admin/features/dashboard/ui/dashboard_screen.dart';
import 'package:zrc/modules/instructor/features/home/ui/instructor_home_screen.dart';
import 'package:zrc/modules/student/features/courses/ui/courses_details_screen.dart';

import '../../modules/student/core/widgets/student_scaffold.dart';
import '../../modules/student/features/courses/ui/courses_screen.dart';
import '../../modules/student/features/home/ui/home_screen.dart';
import '../../modules/student/features/materials/ui/materials_screen.dart';
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
      case Routes.studentMaterialScreen:
        return MaterialPageRoute(builder: (_) => const MaterialsScreen());
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
