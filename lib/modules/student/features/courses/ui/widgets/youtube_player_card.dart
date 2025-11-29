import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zrc/core/utils/spacing.dart';

import 'youtube_player_loading.dart';
import 'youtube_player_error.dart';

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
    _lockPortrait();
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
      flags: YoutubePlayerFlags(autoPlay: widget.autoPlay, mute: false),
    );
  }

  Future<void> _lockPortrait() async {}

  Future<void> _lockLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future<void> _hideSystemUI() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> _showSystemUI() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  Future<void> _enterLandscapeFullscreen() async {
    if (_controller == null) return;

    await _lockLandscape();
    await _hideSystemUI();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              /// Fullscreen player
              Positioned.fill(
                child: YoutubePlayer(
                  controller: _controller!,
                  aspectRatio: 16 / 9,
                ),
              ),

              /// X BUTTON (top-left)
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    _exitLandscapeFullscreen();
  }

  Future<void> _exitLandscapeFullscreen() async {
    await _lockPortrait();
    await _showSystemUI();
  }

  void _skip(int seconds) {
    if (_controller == null) return;

    final current = _controller!.value.position.inSeconds;
    final target = (current + seconds).clamp(0, 99999);
    _controller!.seekTo(Duration(seconds: target));
  }

  @override
  void dispose() {
    _controller?.dispose();
    _showSystemUI();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return YoutubePlayer(
      controller: _controller!,
      aspectRatio: widget.aspectRatio,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      bottomActions: _buildBottomActions(),
    );
  }

  /// ------------------------------
  /// BOTTOM ACTION BAR
  /// ------------------------------
  List<Widget> _buildBottomActions() {
    return [
      const CurrentPosition(),
      const ProgressBar(isExpanded: true),
      horizontalSpacing(10),
      const RemainingDuration(),

      /// REWIND
      IconButton(
        icon: const Icon(Icons.replay_10, color: Colors.white),
        onPressed: () => _skip(-10),
      ),

      /// FORWARD
      IconButton(
        icon: const Icon(Icons.forward_10, color: Colors.white),
        onPressed: () => _skip(10),
      ),

      /// VOLUME SLIDER
      SizedBox(
        width: 100,
        child: Slider(
          value: _volume,
          min: 0,
          max: 100,
          activeColor: Colors.red,
          inactiveColor: Colors.white30,
          onChanged: (value) {
            setState(() => _volume = value);
            _controller!.setVolume(value.toInt());
          },
        ),
      ),

      /// FULLSCREEN BUTTON
      IconButton(
        icon: const Icon(Icons.fullscreen, color: Colors.white),
        onPressed: _enterLandscapeFullscreen,
      ),
    ];
  }
}
