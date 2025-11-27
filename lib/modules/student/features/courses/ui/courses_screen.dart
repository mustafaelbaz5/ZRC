import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/widgets/custom_app_bar.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/all_courses_filter_list_view.dart';
import 'widgets/all_courses_list_view.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: "Courses", routes: 0),
            verticalSpacing(8),
            Text("Categories", style: AppTextStyles.font16BlackBold),
            verticalSpacing(16),
            const AllCoursesFilterListView(),
            const Expanded(child: AllCoursesSliverList()),
          ],
        ),
      ),
    );
  }
}
