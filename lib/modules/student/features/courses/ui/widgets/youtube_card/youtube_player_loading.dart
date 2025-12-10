import 'package:flutter/material.dart';

class YoutubePlayerLoading extends StatelessWidget {
  const YoutubePlayerLoading({super.key, required this.aspectRatio});

  final double aspectRatio;

  @override
  Widget build(final BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: const Center(child: CircularProgressIndicator(color: Colors.red)),
    );
  }
}
