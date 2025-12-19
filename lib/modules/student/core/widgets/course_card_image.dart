import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/models/courses_card_model.dart';

class CourseCardImage extends StatelessWidget {
  const CourseCardImage({super.key, required this.coursesCardModel});
  final CoursesCardModel coursesCardModel;
  @override
  Widget build(final BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            coursesCardModel.image,
            height: responsiveHeight(120),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    context.customColors.surface.withAlpha(100),
                    context.customColors.textPrimary.withAlpha(100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
