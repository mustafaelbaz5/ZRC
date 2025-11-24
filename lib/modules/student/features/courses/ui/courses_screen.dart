import 'package:flutter/material.dart';
import 'package:zrc/modules/student/core/widgets/custom_app_bar.dart';
import 'widgets/all_courses_list_view.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: "Courses", routes: 0),
          Expanded(child: AllCoursesSliverList()),
        ],
      ),
    );
  }
}
