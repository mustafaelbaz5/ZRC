// modules/instructor/core/instructor_scaffold.dart

import 'package:flutter/material.dart';
import 'package:zrc/core/config/constants.dart';
import 'package:zrc/modules/instructor/core/widgets/instructor_drawer.dart';
import 'package:zrc/modules/instructor/features/courses/ui/instructor_courses_screen.dart';
import 'package:zrc/modules/instructor/features/home/ui/instructor_home_screen.dart';
import 'package:zrc/modules/instructor/features/profile/ui/instructor_profile_screen.dart';
import 'package:zrc/modules/instructor/features/quizzes/ui/instructor_quizzes_screen.dart';

class InstructorScaffold extends StatefulWidget {
  const InstructorScaffold({super.key});

  @override
  State<InstructorScaffold> createState() => _InstructorScaffoldState();
}

class _InstructorScaffoldState extends State<InstructorScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    InstructorHomeScreen(),
    InstructorCoursesScreen(),
    InstructorQuizzesScreen(),
    InstructorProfileScreen(),
  ];

  void _onDrawerItemSelected(final int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    Constants.scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      key: Constants.scaffoldKey,
      drawer: InstructorDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: _onDrawerItemSelected,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
