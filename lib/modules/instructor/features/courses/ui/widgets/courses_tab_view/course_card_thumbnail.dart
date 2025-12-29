import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/models/course_model.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/themes/custom_colors.dart';
import '../../../../../../../core/utils/functions/string_fun.dart';
import '../../../../../../../core/utils/spacing.dart';

class CourseCardThumbnail extends StatelessWidget {
  const CourseCardThumbnail({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final thumbnailUrl = getYoutubeThumbnail(course.youtubeUrl);

    return Stack(
      children: [
        // Thumbnail Image
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: thumbnailUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: thumbnailUrl,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 250),
                    progressIndicatorBuilder:
                        (final context, final url, final progress) =>
                            _ThumbnailLoading(
                              colors: colors,
                              progress: progress.progress,
                            ),
                    errorWidget: (final context, final url, final error) =>
                        _ThumbnailError(colors: colors),
                  )
                : _buildPlaceholder(colors),
          ),
        ),

        // Gradient overlay for readability
        Container(
          height: responsiveHeight(200),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.customColors.surfaceVariant.withAlpha(80),
                context.customColors.surfaceVariant.withAlpha(140),
              ],
              stops: const [0.4, 1.0],
            ),
          ),
        ),

        // Status badge
        Positioned(
          top: 12,
          right: 12,
          child: _StatusBadge(status: course.status),
        ),

        // Play icon
        Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: colors.accentBlue,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(final CustomColors colors) {
    return Container(
      color: colors.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.play_circle_outline_rounded,
          size: responsiveFontSize(28),
          color: colors.textSecondary,
        ),
      ),
    );
  }
}

class _ThumbnailLoading extends StatelessWidget {
  final CustomColors colors;
  final double? progress;

  const _ThumbnailLoading({required this.colors, this.progress});

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: colors.surfaceVariant,
      child: Center(
        child: SizedBox(
          width: 36,
          height: 36,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(colors.errorContainer),
          ),
        ),
      ),
    );
  }
}

// Error widget
class _ThumbnailError extends StatelessWidget {
  final CustomColors colors;

  const _ThumbnailError({required this.colors});

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: colors.surfaceVariant,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            size: 40,
            color: colors.textSecondary,
          ),
          verticalSpacing(8),
          Text(
            'Failed to load',
            style: AppTextStyles.font13Regular.copyWith(
              color: colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Status badge
class _StatusBadge extends StatelessWidget {
  final CourseStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(final BuildContext context) {
    final (color, label, icon) = switch (status) {
      CourseStatus.draft => (
        Colors.grey,
        'instructor_courses.drafts'.tr(),
        Icons.edit_rounded,
      ),
      CourseStatus.pending => (
        Colors.orange,
        'instructor_courses.pending'.tr(),
        Icons.schedule_rounded,
      ),
      CourseStatus.approved || CourseStatus.approved => (
        Colors.green,
        'instructor_courses.published'.tr(),
        Icons.check_circle_rounded,
      ),
      CourseStatus.rejected => (
        Colors.red,
        'instructor_courses.rejected'.tr(),
        Icons.cancel_rounded,
      ),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(12),
        vertical: responsiveHeight(6),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: Colors.white),
          horizontalSpacing(6),
          Text(
            label,
            style: AppTextStyles.font13Regular.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
