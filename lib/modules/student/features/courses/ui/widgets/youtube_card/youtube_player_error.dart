import 'package:flutter/material.dart';

class YoutubePlayerError extends StatelessWidget {
  const YoutubePlayerError({
    super.key,
    required this.message,
    required this.onRetry,
    required this.aspectRatio,
  });

  final String message;
  final VoidCallback onRetry;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            Text(message, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
