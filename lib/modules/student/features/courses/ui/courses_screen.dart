import 'package:flutter/material.dart';

import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/all_courses_filter_list_view.dart';
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
            const CustomAppBar(title: "Courses"),
            verticalSpacing(8),
            Text("Categories", style: AppTextStyles.font18GreyRegular),
            verticalSpacing(16),
            const AllCoursesFilterListView(),
            const Expanded(child: AllCoursesSliverList()),
          ],
        ),
      ),
    );
  }
}
