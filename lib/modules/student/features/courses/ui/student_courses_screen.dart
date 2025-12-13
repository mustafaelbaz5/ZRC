import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/widgets/student_app_bar.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/all_courses_filter_list_view.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/all_courses_list_view.dart';

class StudentCoursesScreen extends StatelessWidget {
  const StudentCoursesScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StudentAppBar(title: tr('student_courses.screen_title')),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(18),
                    Text(
                      tr('student_courses.categories'),
                      style: AppTextStyles.font20Bold.copyWith(
                        color: context.customColors.onContainerPrimary,
                      ),
                    ),
                    verticalSpacing(16),
                    const AllCoursesFilterListView(),
                    verticalSpacing(16),

                    const Expanded(child: AllCoursesSliverList()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
