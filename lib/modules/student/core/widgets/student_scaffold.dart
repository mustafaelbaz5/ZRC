import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrc/modules/student/features/home/ui/student_home_screen.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../features/courses/ui/courses_screen.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/quizzes/ui/quizzes_screen.dart';

class StudentScaffold extends StatefulWidget {
  const StudentScaffold({super.key, required this.navigationKey});
  final GlobalKey<CurvedNavigationBarState> navigationKey;
  @override
  State<StudentScaffold> createState() => _StudentScaffoldState();
}

class _StudentScaffoldState extends State<StudentScaffold> {
  int bottomNavIndex = 0;

  late final List<String> icons = <String>[
    AppAssets.homeIcon,
    AppAssets.computerIcon,
    AppAssets.bookIcon,
    AppAssets.profileIcon,
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
        body: <Widget>[
          const StudentHomeScreen(),
          const CoursesScreen(),
          const QuizzesScreen(),
          const ProfileScreen(),
        ][bottomNavIndex],
      ),
    );
  }
}
