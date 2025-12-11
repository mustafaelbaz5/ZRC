import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';

import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../core/models/courses_card_model.dart';

class CourseCardFooter extends StatelessWidget {
  const CourseCardFooter({super.key, required this.coursesCardModel});

  final CoursesCardModel coursesCardModel;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        // Instructor with icon
        Expanded(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.person_outline_rounded,
                size: 14.sp,
                color: Colors.blue,
              ),
              horizontalSpacing(5),
              Expanded(
                child: Text(
                  coursesCardModel.instructor,
                  style: AppTextStyles.font13Bold.copyWith(
                    color: AppColors.primary300,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        horizontalSpacing(8),
        // Date with icon
        Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today_outlined,
              size: 12.sp,
              color: Colors.grey,
            ),
            SizedBox(width: 4.w),
            Text(
              coursesCardModel.data,
              style: AppTextStyles.font13Regular.copyWith(
                color: AppColors.grey300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
