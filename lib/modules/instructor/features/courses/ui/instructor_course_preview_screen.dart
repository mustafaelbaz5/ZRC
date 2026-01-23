import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/models/course_model.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/themes/custom_colors.dart';
import '../../../../../core/utils/functions/date_formate.dart';
import '../../../../../core/utils/functions/string_fun.dart';
import '../../../../../core/utils/spacing.dart';

class InstructorCoursePreviewScreen extends StatelessWidget {
  const InstructorCoursePreviewScreen({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final thumbnailUrl =
        course.thumbnailUrl ?? getYoutubeThumbnail(course.youtubeUrl);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildThumbnail(thumbnailUrl, colors),
              title: Text(
                course.title,
                style: AppTextStyles.font20Bold.copyWith(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              titlePadding: const EdgeInsetsDirectional.only(
                start: 16,
                bottom: 16,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatusBadge(colors),

                  verticalSpacing(16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: colors.surfaceVariant,
                        child: Icon(
                          Icons.person_rounded,
                          color: colors.textSecondary,
                        ),
                      ),
                      horizontalSpacing(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'instructor_course_preview.by_instructor'.tr(),
                            style: AppTextStyles.font13Regular.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                          Text("course.", style: AppTextStyles.font14Bold),
                        ],
                      ),
                    ],
                  ),

                  verticalSpacing(20),

                  if (course.category.isNotEmpty)
                    Chip(
                      label: Text(course.category),
                      backgroundColor: colors.accentBlue.withValues(
                        alpha: 0.12,
                      ),
                      labelStyle: AppTextStyles.font14Bold.copyWith(
                        color: colors.accentBlue,
                      ),
                      avatar: Icon(
                        Icons.category_rounded,
                        size: 18,
                        color: colors.accentBlue,
                      ),
                      side: BorderSide(
                        color: colors.accentBlue.withValues(alpha: 0.3),
                      ),
                    ),

                  verticalSpacing(24),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem(
                        icon: Icons.visibility_rounded,
                        value: course.totalViews.toString(),
                        label: tr('common.views'),
                      ),
                      _StatItem(
                        icon: Icons.star_rounded,
                        value: course.averageRating > 0
                            ? course.averageRating.toStringAsFixed(1)
                            : '-',
                        label: tr('common.rating'),
                      ),
                      _StatItem(
                        icon: Icons.schedule_rounded,
                        value: formatSmart(course.updatedAt),
                        label: tr('common.updated'),
                      ),
                    ],
                  ),

                  verticalSpacing(32),

                  // Description
                  Text(
                    'instructor_course_preview.description'.tr(),
                    style: AppTextStyles.font18Bold,
                  ),
                  verticalSpacing(12),
                  Text(
                    course.description,
                    style: AppTextStyles.font16Regular.copyWith(height: 1.6),
                  ),

                  verticalSpacing(32),

                  // What You'll Learn
                  if (course.learningPoints.isNotEmpty) ...[
                    Text(
                      'instructor_course_preview.what_you_learn'.tr(),
                      style: AppTextStyles.font18Bold,
                    ),
                    verticalSpacing(16),
                    ...course.learningPoints.map(
                      (final point) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: colors.accentBlue,
                              size: 24,
                            ),
                            horizontalSpacing(12),
                            Expanded(
                              child: Text(
                                point.trim(),
                                style: AppTextStyles.font16Regular.copyWith(
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  verticalSpacing(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(final String? url, final CustomColors colors) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (url != null && url.isNotEmpty)
          Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder:
                (final context, final child, final loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : Container(color: colors.surfaceVariant);
                },
            errorBuilder: (_, final _, final _) =>
                Container(color: colors.surfaceVariant),
          )
        else
          Container(color: colors.surfaceVariant),

        // Dark gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
            ),
          ),
        ),

        // Play button
        Center(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white.withValues(alpha: 0.9),
            child: Icon(
              Icons.play_arrow_rounded,
              size: 50,
              color: colors.accentBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(final CustomColors colors) {
    final (color, label) = switch (course.status) {
      CourseStatus.draft => (Colors.grey.shade600, tr('common.draft')),
      CourseStatus.pending => (Colors.orange.shade600, tr('common.pending')),
      CourseStatus.published => (Colors.green.shade600, tr('common.published')),
      CourseStatus.rejected => (Colors.red.shade600, tr('common.rejected')),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: context.customColors.accentBlue),
        verticalSpacing(8),
        Text(value, style: AppTextStyles.font16Bold),
        Text(
          label,
          style: AppTextStyles.font13Regular.copyWith(
            color: context.customColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
