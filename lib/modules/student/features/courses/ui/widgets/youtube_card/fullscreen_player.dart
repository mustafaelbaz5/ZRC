import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

/// Fullscreen Player
class FullscreenPlayer extends StatelessWidget {
  final YoutubePlayerController controller;
  final VoidCallback onClose;

  const FullscreenPlayer({
    super.key,
    required this.controller,
    required this.onClose,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
              showVideoProgressIndicator: true,
              progressIndicatorColor: AppColors.error100,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Material(
              color: AppColors.grey900,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColors.grey0,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 64,
            right: 64,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(16),
                vertical: responsiveHeight(8),
              ),
              decoration: BoxDecoration(
                color: AppColors.grey900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                controller.metadata.title,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.grey0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
