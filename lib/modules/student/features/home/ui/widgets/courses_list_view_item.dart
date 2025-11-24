import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../core/models/courses_card_model.dart';
import 'course_card_footer.dart';
import 'course_card_image.dart';

class CoursesListViewCard extends StatelessWidget {
  final CoursesCardModel coursesCardModel;
  final VoidCallback? onTap;

  const CoursesListViewCard({
    super.key,
    required this.coursesCardModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseCardImage(coursesCardModel: coursesCardModel),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coursesCardModel.title,
                      style: AppTextStyles.font16BlackBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(6),
                    Text(
                      coursesCardModel.description,
                      style: AppTextStyles.font13greyRegular,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                    CourseCardFooter(coursesCardModel: coursesCardModel),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
