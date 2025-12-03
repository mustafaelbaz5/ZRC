import 'package:easy_localization/easy_localization.dart';
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
            CustomAppBar(title: tr('student_courses.screen_title')),
            verticalSpacing(18),
            Text(
              tr('student_courses.categories'),
              style: AppTextStyles.font20BlackBold(),
            ),
            verticalSpacing(8),
            const AllCoursesFilterListView(),
            const Expanded(child: AllCoursesSliverList()),
          ],
        ),
      ),
    );
  }
}
