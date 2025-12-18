import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/modules/student/core/widgets/course_card_image.dart';

import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../core/models/courses_card_model.dart';

class AllCoursesListViewCard extends StatelessWidget {
  const AllCoursesListViewCard({super.key, required this.coursesCardModel});

  final CoursesCardModel coursesCardModel;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: responsiveHeight(250),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: responsiveHeight(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: context.customColors.surface,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.border,
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          CourseCardImage(coursesCardModel: coursesCardModel),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: context.isArabic
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    coursesCardModel.title,
                    style: AppTextStyles.font16Bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(8),
                  Text(
                    coursesCardModel.description,
                    style: AppTextStyles.font13Regular.copyWith(
                      color: context.customColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: context.isArabic
                        ? TextAlign.end
                        : TextAlign.start,
                  ),
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person_outline_rounded,
                              size: 16.sp,
                              color: context.customColors.textPrimary,
                            ),
                            horizontalSpacing(6),
                            Expanded(
                              child: Text(
                                coursesCardModel.instructor,
                                style: AppTextStyles.font13Bold.copyWith(
                                  color: context.customColors.textPrimary,
                                ),
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
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14.sp,
                            color: context.customColors.textPrimary,
                          ),
                          horizontalSpacing(6),
                          Text(
                            coursesCardModel.data,
                            style: AppTextStyles.font13Regular.copyWith(
                              color: context.customColors.textPrimary,
                            ),
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
