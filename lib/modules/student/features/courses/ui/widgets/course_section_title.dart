import 'package:flutter/material.dart';

class CourseSectionTitle extends StatelessWidget {
  const CourseSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(final BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
