import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_app_bar.dart';
import 'package:zrc/modules/instructor/features/courses/data/models/instructor_course_model.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/thumbnail_preview.dart';

class InstructorCoursePreviewScreen extends StatelessWidget {
  const InstructorCoursePreviewScreen({super.key, required this.course});

  final InstructorCourseModel course;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final thumbnailUrl = getYoutubeThumbnail(course.youtubeUrl);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'instructor_course_preview.title'.tr(),
              showBackButton: true,
              showNotificationIcon: false,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(20),

                      ThumbnailPreview(thumbnailUrl: thumbnailUrl),
                      verticalSpacing(24),

                      Text(
                        course.title,
                        style: AppTextStyles.font24Bold.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),

                      verticalSpacing(12),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: responsiveRadius(16),
                            backgroundColor: colors.surfaceVariant,
                            child: Icon(
                              Icons.person_rounded,
                              color: colors.textSecondary,
                            ),
                          ),
                          horizontalSpacing(12),
                          Text(
                            "course.instructorName",
                            style: AppTextStyles.font14Regular.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ],
                      ),

                      verticalSpacing(20),

                      /// Category Chip
                      if (course.category.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16),
                            vertical: responsiveHeight(6),
                          ),
                          decoration: BoxDecoration(
                            color: colors.surfaceVariant,
                            borderRadius: BorderRadius.circular(
                              responsiveRadius(20),
                            ),
                          ),
                          child: Text(
                            course.category,
                            style: AppTextStyles.font13Bold.copyWith(
                              color: colors.textPrimary,
                            ),
                          ),
                        ),

                      verticalSpacing(28),

                      /// Description
                      Text(
                        'instructor_course_preview.description'.tr(),
                        style: AppTextStyles.font16Bold.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                      verticalSpacing(12),
                      Text(
                        course.description,
                        style: AppTextStyles.font14Regular.copyWith(
                          color: colors.textPrimary,
                          height: 1.6,
                        ),
                      ),

                      verticalSpacing(32),

                      /// What You'll Learn
                      if (course.learningPoints != null &&
                          course.learningPoints!.isNotEmpty) ...[
                        Text(
                          'instructor_course_preview.what_you_learn'.tr(),
                          style: AppTextStyles.font16Bold.copyWith(
                            color: colors.textPrimary,
                          ),
                        ),
                        verticalSpacing(16),
                        ...course.learningPoints!.map(
                          (final point) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: responsiveHeight(6),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  size: responsiveRadius(20),
                                  color: colors.accentBlue,
                                ),
                                horizontalSpacing(12),
                                Expanded(
                                  child: Text(
                                    point.trim(),
                                    style: AppTextStyles.font14Regular.copyWith(
                                      color: colors.textPrimary,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

                      verticalSpacing(24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
