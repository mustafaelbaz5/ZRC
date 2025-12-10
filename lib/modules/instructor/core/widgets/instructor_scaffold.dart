import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrc/modules/instructor/features/courses/ui/instructor_courses_screen.dart';
import 'package:zrc/modules/instructor/features/home/ui/instructor_home_screen.dart';
import 'package:zrc/modules/instructor/features/profile/ui/instructor_profile_screen.dart';
import 'package:zrc/modules/instructor/features/quizzes/ui/instructor_quizzes_screen.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/app_assets.dart';

class InstructorScaffold extends StatefulWidget {
  const InstructorScaffold({super.key, required this.navigationKey});
  final GlobalKey<CurvedNavigationBarState> navigationKey;

  @override
  State<InstructorScaffold> createState() => _InstructorScaffoldState();
}

class _InstructorScaffoldState extends State<InstructorScaffold> {
  int bottomNavIndex = 0;

  // Instructor-specific navigation icons
  late final List<String> icons = <String>[
    AppAssets.homeIcon, // Home/Dashboard
    AppAssets.computerIcon, // Courses Management
    AppAssets.bookIcon, // Quizzes/Content
    AppAssets.profileIcon, // Profile/Settings
  ];

  // Instructor screens corresponding to each nav item
  late final List<Widget> screens = <Widget>[
    const InstructorHomeScreen(), // Home Dashboard
    const InstructorCoursesScreen(), // Courses Management
    const InstructorQuizzesScreen(), // Quizzes & Content
    const InstructorProfileScreen(), // Profile & Settings
  ];

  @override
  Widget build(final BuildContext context) {
    const Color activeColor = Colors.white;
    const Color inactiveColor = AppColors.lightBlue;

    final List<ColorFiltered> items = icons.map((final String icon) {
      final int i = icons.indexOf(icon);

      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          i == bottomNavIndex ? activeColor : inactiveColor,
          BlendMode.srcIn,
        ),
        child: SvgPicture.asset(icon, height: 24.h, width: 24.w),
      );
    }).toList();

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: widget.navigationKey,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          backgroundColor: Colors.transparent,
          color: const Color.fromARGB(255, 242, 242, 242),
          buttonBackgroundColor: AppColors.darkBlue,
          height: 50.h,
          index: bottomNavIndex,
          items: items,
          onTap: (final int index) => setState(() => bottomNavIndex = index),
        ),
        body: screens[bottomNavIndex],
      ),
    );
  }
}
