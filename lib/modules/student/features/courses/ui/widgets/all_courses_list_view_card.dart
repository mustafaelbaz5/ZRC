import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/models/courses_card_model.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/course_card_image.dart';

class AllCoursesListViewCard extends StatelessWidget {
  const AllCoursesListViewCard({super.key, required this.coursesCardModel});

  final CoursesCardModel coursesCardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 16,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseCardImage(coursesCardModel: coursesCardModel),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    coursesCardModel.title,
                    style: AppTextStyles.font16BlackBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(8),
                  Text(
                    coursesCardModel.description,
                    style: AppTextStyles.font13greyRegular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              size: 16.sp,
                              color: Colors.blue,
                            ),
                            horizontalSpacing(6),
                            Expanded(
                              child: Text(
                                coursesCardModel.instructor,
                                style: AppTextStyles.font13BlueBold,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpacing(12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14.sp,
                            color: Colors.grey[600],
                          ),
                          horizontalSpacing(6),
                          Text(
                            coursesCardModel.data,
                            style: AppTextStyles.font13greyRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
