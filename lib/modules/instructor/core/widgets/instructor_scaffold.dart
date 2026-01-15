import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class InstructorScaffold extends StatefulWidget {
  const InstructorScaffold({super.key, this.selectedIndex = 0});
  final int selectedIndex;

  @override
  State<InstructorScaffold> createState() => _InstructorScaffoldState();
}

class _InstructorScaffoldState extends State<InstructorScaffold> {
  late int _selectedIndex;
  late final InstructorCoursesCubit _coursesCubit;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _coursesCubit = getIt<InstructorCoursesCubit>();
    if (_selectedIndex == 1) {
      _coursesCubit.loadInstructorCourses();
    }
  }

  List<Widget> get _screens => [
    const InstructorHomeScreen(),
    BlocProvider.value(
      value: _coursesCubit,
      child: const InstructorCoursesScreen(),
    ),
    const InstructorQuizzesScreen(),
    const InstructorProfileScreen(),
  ];

  void _onDrawerItemSelected(final int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 1) {
        _coursesCubit.loadInstructorCourses();
      }
    }
    Constants.scaffoldKey.currentState?.closeDrawer();
  }

  Future<void> _onAddNewCourse() async {
    final result = await context.pushNamed(Routes.addEditCourseScreen);

    if (result != null && result is bool && result == true) {
      _coursesCubit.loadInstructorCourses();
    }
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
          ? BlocBuilder<InstructorCoursesCubit, InstructorCoursesState>(
              bloc: _coursesCubit,
              builder: (final context, final state) {
                final isLoading = state is InstructorCoursesLoading;
                return CustomFloatingButton(
                  label: 'instructor_courses.new_course'.tr(),
                  onTap: isLoading ? null : _onAddNewCourse,
                );
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
