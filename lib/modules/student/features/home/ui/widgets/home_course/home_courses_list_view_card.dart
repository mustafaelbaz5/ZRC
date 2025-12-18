import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/models/courses_card_model.dart';
import 'package:zrc/modules/student/core/widgets/course_card_image.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_course/home_course_card_footer.dart';

class HomeCoursesListViewCard extends StatelessWidget {
  final CoursesCardModel coursesCardModel;
  final VoidCallback? onTap;

  const HomeCoursesListViewCard({
    super.key,
    required this.coursesCardModel,
    this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: responsiveHeight(16)),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: context.isDarkMode
                  ? Colors.transparent
                  : Colors.black.withAlpha(20),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CourseCardImage(coursesCardModel: coursesCardModel),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      coursesCardModel.title,
                      style: AppTextStyles.font16Bold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(6),
                    Text(
                      coursesCardModel.description,
                      style: AppTextStyles.font13Regular.copyWith(
                        color: AppColors.grey300,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                    HomeCourseCardFooter(coursesCardModel: coursesCardModel),
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
