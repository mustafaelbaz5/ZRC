import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerCard extends StatefulWidget {
  const YoutubePlayerCard({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<YoutubePlayerCard> createState() => _YoutubePlayerCardState();
}

class _YoutubePlayerCardState extends State<YoutubePlayerCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayerController.convertUrlToId(
      widget.videoUrl.split('?').first, // remove extra query params
    );

    if (videoId == null) {
      throw Exception("Invalid YouTube URL: ${widget.videoUrl}");
    }

    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(showFullscreenButton: true),
    )..loadVideoById(videoId: videoId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: YoutubePlayer(controller: _controller, aspectRatio: 16 / 9),
      ),
    );
  }
}
