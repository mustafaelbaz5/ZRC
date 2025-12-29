import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/modules/instructor/features/courses/logic/cubit/instructor_courses_cubit.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/courses_tab_view/courses_empty_state.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_tab_bar.dart';
import 'widgets/instructor_courses_tab_view.dart';

class InstructorCoursesScreen extends StatefulWidget {
  const InstructorCoursesScreen({super.key});

  @override
  State<InstructorCoursesScreen> createState() =>
      _InstructorCoursesScreenState();
}

class _InstructorCoursesScreenState extends State<InstructorCoursesScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<CourseStatus> _tabs = const [
    CourseStatus.draft,
    CourseStatus.pending,
    CourseStatus.approved,
    CourseStatus.rejected,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: tr('instructor_drawer.courses', context: context),
            showNotificationIcon: true,
          ),
          verticalSpacing(16),

          CustomTabBar(
            controller: _tabController,
            tabs: [
              CustomTabItem(
                label: tr('instructor_courses.drafts', context: context),
                icon: Icons.edit_note_outlined,
              ),
              CustomTabItem(
                label: tr('instructor_courses.pending', context: context),
                icon: Icons.schedule_outlined,
              ),
              CustomTabItem(
                label: tr('instructor_courses.published', context: context),
                icon: Icons.check_circle_outlined,
              ),
              CustomTabItem(
                label: tr('instructor_courses.rejected', context: context),
                icon: Icons.cancel_outlined,
              ),
            ],
          ),
          verticalSpacing(16),
          Expanded(
            child: BlocBuilder<InstructorCoursesCubit, InstructorCoursesState>(
              builder: (final context, final state) {
                final isLoading = state is InstructorCoursesLoading;
                final courses = state is InstructorCoursesLoaded
                    ? state.courses
                    : <CourseModel>[];
                final hasError = state is InstructorCoursesError;

                return TabBarView(
                  controller: _tabController,
                  children: _tabs.map((final status) {
                    if (isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (hasError || courses.isEmpty) {
                      return CoursesEmptyState(status: status);
                    }

                    final filteredCourses = courses
                        .where((final c) => c.status == status)
                        .toList();

                    return InstructorCoursesTabView(
                      statuses: [status],
                      courses: filteredCourses,
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
