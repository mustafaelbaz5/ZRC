import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';

import '../../../../core/config/constants.dart';
import '../../features/courses/ui/instructor_courses_screen.dart';
import '../../features/courses/ui/widgets/custom_floating_button.dart';
import '../../features/home/ui/instructor_home_screen.dart';
import '../../features/profile/ui/instructor_profile_screen.dart';
import '../../features/quizzes/ui/instructor_quizzes_screen.dart';
import 'instructor_drawer.dart';

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
      floatingActionButton: _selectedIndex == 1
          ? CustomFloatingButton(
              label: 'instructor_courses.new_course'.tr(),
              onTap: () => context.pushNamed(Routes.addEditCourseScreen),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
