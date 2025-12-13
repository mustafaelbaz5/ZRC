import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/youtube_card/youtube_player_card.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String courseTitle;

  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.courseTitle,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(16),
                vertical: responsiveHeight(8),
              ),
              color: Colors.black87,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      courseTitle,
                      style: AppTextStyles.font18Bold.copyWith(
                        color: AppColors.grey0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: YoutubePlayerCard(videoUrl: videoUrl, autoPlay: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
