import 'package:flutter/material.dart';
import 'package:zrc/core/models/course_model.dart';

import '../../../../../../core/utils/spacing.dart';
import 'courses_tab_view/courses_empty_state.dart';
import 'instructor_course_card.dart';

class InstructorCoursesTabView extends StatelessWidget {
  final List<CourseStatus> statuses;
  final List<CourseModel> courses;

  const InstructorCoursesTabView({
    super.key,
    required this.statuses,
    required this.courses,
  });

  @override
  Widget build(final BuildContext context) {
    final filteredCourses = courses
        .where((final course) => statuses.contains(course.status))
        .toList();

    if (filteredCourses.isEmpty) {
      return CoursesEmptyState(status: statuses.first);
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(16),
      ),
      itemCount: filteredCourses.length,
      itemBuilder: (final context, final index) {
        return Padding(
          padding: EdgeInsets.only(bottom: responsiveHeight(16)),
          child: InstructorCourseCard(course: filteredCourses[index]),
        );
      },
    );
  }
}
