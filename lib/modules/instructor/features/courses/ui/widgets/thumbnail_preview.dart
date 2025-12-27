import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class ThumbnailPreview extends StatelessWidget {
  const ThumbnailPreview({super.key, required this.thumbnailUrl});

  final String thumbnailUrl;

  @override
  Widget build(final BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(responsiveRadius(16)),
      child: CachedNetworkImage(
        imageUrl: thumbnailUrl,
        height: responsiveHeight(220),
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (final context, final url) => Container(
          height: responsiveHeight(220),
          color: context.customColors.surfaceVariant,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (_, final _, final _) => Container(
          height: responsiveHeight(220),
          color: context.customColors.surfaceVariant,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: responsiveRadius(48),
                color: context.customColors.textSecondary,
              ),
              verticalSpacing(12),
              Text(
                'Failed to load thumbnail',
                style: AppTextStyles.font14Regular.copyWith(
                  color: context.customColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
