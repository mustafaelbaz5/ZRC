import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_tab_bar.dart';
import '../data/models/instructor_course_model.dart';
import 'widgets/instructor_courses_tab_view.dart';

class InstructorCoursesScreen extends StatefulWidget {
  const InstructorCoursesScreen({super.key});

  @override
  State<InstructorCoursesScreen> createState() =>
      _InstructorCoursesScreenState();
}

class _InstructorCoursesScreenState extends State<InstructorCoursesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
          // App Bar
          CustomAppBar(
            title: tr('instructor_drawer.courses', context: context),
            showNotificationIcon: true,
          ),
          verticalSpacing(16),

          // Custom Tab Bar with 4 tabs
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
            child: TabBarView(
              controller: _tabController,
              children: const [
                InstructorCoursesTabView(statuses: [CourseStatus.draft]),
                InstructorCoursesTabView(statuses: [CourseStatus.pending]),
                InstructorCoursesTabView(
                  statuses: [CourseStatus.approved, CourseStatus.published],
                ),
                InstructorCoursesTabView(statuses: [CourseStatus.rejected]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
