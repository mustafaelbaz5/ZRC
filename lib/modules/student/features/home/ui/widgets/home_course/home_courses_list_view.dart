import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/models/courses_card_model.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_course/home_courses_list_view_card.dart';

class HomeCoursesListView extends StatelessWidget {
  const HomeCoursesListView({super.key});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: responsiveHeight(260),
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
        physics: const BouncingScrollPhysics(),
        itemCount: _getDummyCourses().length,

        itemBuilder: (final BuildContext context, final int index) {
          return SizedBox(
            width: 230.w,
            child: GestureDetector(
              child: HomeCoursesListViewCard(
                coursesCardModel: _getDummyCourses()[index],
                onTap: () {
                  context.pushNamed(Routes.studentCoursesDetailsScreen);
                },
              ),
            ),
          );
        },

        separatorBuilder: (final BuildContext context, final int index) =>
            horizontalSpacing(16),
      ),
    );
  }
}

List<CoursesCardModel> _getDummyCourses() {
  return <CoursesCardModel>[
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
