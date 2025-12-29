import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/models/course_model.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/router/routes.dart';
import '../../features/courses/logic/cubit/instructor_courses_cubit.dart';
import '../../features/courses/ui/instructor_courses_screen.dart';
import '../../features/courses/ui/widgets/custom_floating_button.dart';
import '../../features/home/ui/instructor_home_screen.dart';
import '../../features/profile/ui/instructor_profile_screen.dart';
import '../../features/quizzes/ui/instructor_quizzes_screen.dart';
import 'instructor_drawer.dart';

// ignore: must_be_immutable
class InstructorScaffold extends StatefulWidget {
  InstructorScaffold({super.key, this.selectedIndex = 0});
  int selectedIndex;

  @override
  State<InstructorScaffold> createState() => _InstructorScaffoldState();
}

class _InstructorScaffoldState extends State<InstructorScaffold> {
  final List<Widget> _screens = [
    const InstructorHomeScreen(),
    BlocProvider(
      create: (_) => getIt<InstructorCoursesCubit>()..getInstructorCourses(),
      child: const InstructorCoursesScreen(),
    ),
    const InstructorQuizzesScreen(),
    const InstructorProfileScreen(),
  ];

  void _onDrawerItemSelected(final int index) {
    if (widget.selectedIndex != index) {
      setState(() {
        widget.selectedIndex = index;
      });
    }
    Constants.scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      key: Constants.scaffoldKey,
      drawer: InstructorDrawer(
        selectedIndex: widget.selectedIndex,
        onItemSelected: _onDrawerItemSelected,
      ),
      body: _screens[widget.selectedIndex],
      floatingActionButton: widget.selectedIndex == 1
          ? CustomFloatingButton(
              label: 'instructor_courses.new_course'.tr(),
              onTap: () {
                context.pushNamed(
                  Routes.addEditCourseScreen,
                  arguments: {'course': CourseModel.newDraft()},
                );
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
