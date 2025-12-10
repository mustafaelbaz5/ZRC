import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/widgets/student_app_bar.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/all_courses_filter_list_view.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/all_courses_list_view.dart';

class StudentCoursesScreen extends StatelessWidget {
  const StudentCoursesScreen({super.key});
  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StudentAppBar(title: tr('student_courses.screen_title')),
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
