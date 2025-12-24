import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/utils/spacing.dart';

/// Bottom Controls Widget
class YoutubePlayerControls extends StatelessWidget {
  const YoutubePlayerControls({
    super.key,
    required this.controller,
    required this.volume,
    required this.onVolumeChanged,
    required this.onTogglePlayPause,
    required this.onSeek,
    required this.onEnterFullscreen,
  });

  final YoutubePlayerController controller;
  final double volume;
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback onTogglePlayPause;
  final ValueChanged<int> onSeek;
  final VoidCallback onEnterFullscreen;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: AppColors.grey0,
          ),
          onPressed: onTogglePlayPause,
        ),
        const CurrentPosition(),
        const Expanded(child: ProgressBar(isExpanded: true)),
        const RemainingDuration(),
        IconButton(
          icon: const Icon(Icons.replay_10, color: AppColors.grey0),
          onPressed: () => onSeek(-10),
        ),
        IconButton(
          icon: const Icon(Icons.forward_10, color: AppColors.grey0),
          onPressed: () => onSeek(10),
        ),
        PopupMenuButton<double>(
          icon: Icon(
            volume == 0
                ? Icons.volume_off
                : volume < 50
                ? Icons.volume_down
                : Icons.volume_up,
            color: AppColors.grey0,
          ),
          tooltip: 'Volume',
          color: AppColors.grey900,
          offset: const Offset(0, -120),
          itemBuilder: (_) => [
            PopupMenuItem(
              enabled: false,
              child: SizedBox(
                width: responsiveWidth(40),
                height: responsiveHeight(100),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    value: volume,
                    min: 0,
                    max: 100,
                    activeColor: AppColors.error100,
                    inactiveColor: AppColors.grey300,
                    onChanged: onVolumeChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen, color: AppColors.grey0),
          onPressed: onEnterFullscreen,
        ),
      ],
    );
  }
}
