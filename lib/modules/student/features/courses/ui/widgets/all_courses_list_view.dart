import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import '../../../../../../core/router/routes.dart';
import '../../../../core/models/courses_card_model.dart';

import 'all_courses_list_view_card.dart';

class AllCoursesSliverList extends StatelessWidget {
  const AllCoursesSliverList({super.key});

  @override
  Widget build(final BuildContext context) {
    // Generate dummy course data
    final List<CoursesCardModel> courses = List.generate(
      10,
      (final int index) => CoursesCardModel(
        image: 'assets/images/test.jpg',
        title: 'Mathematics ${index + 1}',
        description: 'Learn the basics of algebra, geometry, and calculus.',
        instructor: 'Mustafa Elbaz',
        data: '17 May 2023',
      ),
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((
              final BuildContext context,
              final int index,
            ) {
              final CoursesCardModel course = courses[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.studentCoursesDetailsScreen,
                      arguments: <String, CoursesCardModel>{'course': course},
                    );
                  },
                  child: AllCoursesListViewCard(coursesCardModel: course),
                ),
              );
            }, childCount: courses.length),
          ),
        ),
      ],
    );
  }
}
