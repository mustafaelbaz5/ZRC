import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/extensions/navigation.dart';
import '../../../../../../core/router/routes.dart';
import '../../../../core/models/courses_card_model.dart';

import 'all_courses_list_view_card.dart';

class AllCoursesSliverList extends StatelessWidget {
  const AllCoursesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate dummy course data
    final List<CoursesCardModel> courses = List.generate(
      10,
      (index) => CoursesCardModel(
        image: 'assets/images/test.jpg',
        title: 'Mathematics ${index + 1}',
        description: 'Learn the basics of algebra, geometry, and calculus.',
        instructor: 'Mustafa Elbaz',
        data: '17 May 2023',
      ),
    );

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final course = courses[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.studentCoursesDetailsScreen,
                      arguments: course,
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
