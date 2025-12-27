import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import 'fullscreen_player.dart';
import 'youtube_player_controls.dart';

import 'youtube_player_error.dart';
import 'youtube_player_loading.dart';

class YoutubePlayerCard extends StatefulWidget {
  const YoutubePlayerCard({
    super.key,
    required this.videoUrl,
    this.autoPlay = false,
    this.aspectRatio = 16 / 9,
  });

  final String videoUrl;
  final bool autoPlay;
  final double aspectRatio;

  @override
  State<YoutubePlayerCard> createState() => _YoutubePlayerCardState();
}

class _YoutubePlayerCardState extends State<YoutubePlayerCard> {
  YoutubePlayerController? _controller;
  String? _errorMessage;
  double _volume = 100;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoId == null) {
      setState(() => _errorMessage = "Invalid YouTube URL");
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
        enableCaption: true,
        hideControls: false,
      ),
    );
  }

  Future<void> _enterFullscreen() async {
    if (_controller == null) return;

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    if (!mounted) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FullscreenPlayer(
          controller: _controller!,
          onClose: _exitFullscreen,
        ),
      ),
    );

    _exitFullscreen();
  }

  Future<void> _exitFullscreen() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  void _seek(final int seconds) {
    if (_controller == null || !_controller!.value.isReady) return;

    final current = _controller!.value.position.inSeconds;
    final duration = _controller!.metadata.duration.inSeconds;
    final target = (current + seconds).clamp(0, duration);

    _controller!.seekTo(Duration(seconds: target));
  }

  void _togglePlayPause() {
    if (_controller == null) return;
    _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _exitFullscreen();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    if (_errorMessage != null) {
      return YoutubePlayerError(
        message: _errorMessage!,
        aspectRatio: widget.aspectRatio,
        onRetry: () {
          setState(() {
            _errorMessage = null;
            _initializeController();
          });
        },
      );
    }

    if (_controller == null) {
      return YoutubePlayerLoading(aspectRatio: widget.aspectRatio);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: YoutubePlayer(
        controller: _controller!,
        aspectRatio: widget.aspectRatio,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.error100,
        progressColors: const ProgressBarColors(
          playedColor: AppColors.error100,
          handleColor: AppColors.error100,
          bufferedColor: AppColors.grey300,
          backgroundColor: AppColors.grey200,
        ),
        topActions: [
          horizontalSpacing(8),
          Expanded(
            child: Text(
              _controller!.metadata.title,
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.grey0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
        bottomActions: [
          YoutubePlayerControls(
            controller: _controller!,
            volume: _volume,
            onVolumeChanged: (final value) => setState(() => _volume = value),
            onTogglePlayPause: _togglePlayPause,
            onSeek: _seek,
            onEnterFullscreen: _enterFullscreen,
          ),
        ],
      ),
    );
  }
}
