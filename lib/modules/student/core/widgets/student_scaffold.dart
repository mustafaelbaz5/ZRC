import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/themes/app_colors.dart';
import 'package:zrc/core/utils/app_assets.dart';
import '../../features/courses/ui/courses_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/materials/ui/materials_screen.dart';
import '../../features/profile/ui/profile_screen.dart';

class StudentScaffold extends StatefulWidget {
  const StudentScaffold({super.key, required this.navigationKey});
  final GlobalKey<CurvedNavigationBarState> navigationKey;
  @override
  State<StudentScaffold> createState() => _StudentScaffoldState();
}

class _StudentScaffoldState extends State<StudentScaffold> {
  int bottomNavIndex = 0;

  late final List<String> icons = [
    AppAssets.homeIcon,
    AppAssets.computerIcon,
    AppAssets.bookIcon,
    AppAssets.profileIcon,
  ];

  @override
  Widget build(BuildContext context) {
    const activeColor = Colors.white;
    const inactiveColor = AppColors.lightBlue;

    final items = icons.map((icon) {
      int i = icons.indexOf(icon);

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
          onTap: (index) => setState(() => bottomNavIndex = index),
        ),
        body: [
          HomeScreen(),
          CoursesScreen(),
          const MaterialsScreen(),
          const ProfileScreen(),
        ][bottomNavIndex],
      ),
    );
  }
}
