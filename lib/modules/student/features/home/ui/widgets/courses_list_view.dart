import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/navigation.dart';

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
        itemCount: _dummyCourses.length,

        // Item Builder
        itemBuilder: (context, index) {
          return SizedBox(
            width: 230.w,
            child: GestureDetector(
              child: CoursesListViewCard(
                coursesCardModel: _dummyCourses[index],
                onTap: () {
                  context.pushNamed(
                    Routes.studentCoursesDetailsScreen,
                  );
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
final List<CoursesCardModel> _dummyCourses = [
  CoursesCardModel(
    image: 'assets/images/test.jpg',
    title: 'Mathematics',
    description: 'Learn the basics of algebra, geometry, and calculus.',
    instructor: 'Mustafa Elbaz',
    data: '17 May 2023',
  ),
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Physics',
    description: 'Explore the laws of nature, motion, and energy.',
    instructor: 'John Doe',
    data: '17 May 2023',
  ),
  CoursesCardModel(
    image: 'assets/images/test.jpg',
    title: 'Chemistry',
    description: 'Discover the world of elements, compounds, and reactions.',
    instructor: 'Dr. Sarah Smith',
    data: '20 May 2023',
  ),
  CoursesCardModel(
    image: 'assets/images/test.jpg',
    title: 'Computer Science',
    description: 'Master programming fundamentals and algorithms.',
    instructor: 'Ahmed Hassan',
    data: '22 May 2023',
  ),
  CoursesCardModel(
    image: 'assets/images/test.jpg',
    title: 'Biology',
    description: 'Explore the science of life and living organisms.',
    instructor: 'Dr. Emily Chen',
    data: '25 May 2023',
  ),
  CoursesCardModel(
    image: 'assets/images/test.jpg',
    title: 'English Literature',
    description: 'Analyze classic and contemporary literary works.',
    instructor: 'Prof. Michael Brown',
    data: '28 May 2023',
  ),
];
