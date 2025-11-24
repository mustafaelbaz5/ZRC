import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/courses_card_model.dart';

class CourseCardImage extends StatelessWidget {
  const CourseCardImage({super.key, required this.coursesCardModel});
  final CoursesCardModel coursesCardModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Stack(
        children: [
          Image.asset(
            coursesCardModel.image,
            height: 120.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withAlpha(20)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
