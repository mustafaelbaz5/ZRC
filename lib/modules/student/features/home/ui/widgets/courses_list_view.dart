import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/navigation.dart';
import '../../../../../../core/router/routes.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../core/models/courses_card_model.dart';
import 'courses_list_view_item.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const BouncingScrollPhysics(),
        itemCount: _getDummyCourses().length,

        // Item Builder
        itemBuilder: (context, index) {
          return SizedBox(
            width: 230.w,
            child: GestureDetector(
              child: CoursesListViewCard(
                coursesCardModel: _getDummyCourses()[index],
                onTap: () {
                  context.pushNamed(Routes.studentCoursesDetailsScreen);
                },
              ),
            ),
          );
        },

        // Separator Builder → space between items
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
      ),
    );
  }
}

// ==================== Dummy Data ====================
List<CoursesCardModel> _getDummyCourses() {
  return [
    CoursesCardModel(
      image: 'assets/images/test.jpg',
      title: tr('student_home.sample_courses.mathematics.title'),
      description: tr('student_home.sample_courses.mathematics.description'),
      instructor: 'Mustafa Elbaz',
      data: '17 May 2023',
    ),
    CoursesCardModel(
      image: AppAssets.onBoardingBanner1,
      title: tr('student_home.sample_courses.physics.title'),
      description: tr('student_home.sample_courses.physics.description'),
      instructor: 'John Doe',
      data: '17 May 2023',
    ),
    CoursesCardModel(
      image: 'assets/images/test.jpg',
      title: tr('student_home.sample_courses.chemistry.title'),
      description: tr('student_home.sample_courses.chemistry.description'),
      instructor: 'Dr. Sarah Smith',
      data: '20 May 2023',
    ),
    CoursesCardModel(
      image: 'assets/images/test.jpg',
      title: tr('student_home.sample_courses.computer_science.title'),
      description: tr(
        'student_home.sample_courses.computer_science.description',
      ),
      instructor: 'Ahmed Hassan',
      data: '22 May 2023',
    ),
    CoursesCardModel(
      image: 'assets/images/test.jpg',
      title: tr('student_home.sample_courses.biology.title'),
      description: tr('student_home.sample_courses.biology.description'),
      instructor: 'Dr. Emily Chen',
      data: '25 May 2023',
    ),
    CoursesCardModel(
      image: 'assets/images/test.jpg',
      title: tr('student_home.sample_courses.english_literature.title'),
      description: tr(
        'student_home.sample_courses.english_literature.description',
      ),
      instructor: 'Prof. Michael Brown',
      data: '28 May 2023',
    ),
  ];
}
