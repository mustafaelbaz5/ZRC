import 'package:flutter/material.dart';

class ActiveQuizCard extends StatelessWidget {
  final String title;
  final int questionsCount;
  final String deadline;
  final VoidCallback onTap;

  const ActiveQuizCard({
    super.key,
    required this.title,
    required this.questionsCount,
    required this.deadline,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250, // fixed width for horizontal scrolling
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.quiz, size: 40, color: Colors.blue),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "$questionsCount Questions",
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            Text(
              "Deadline: $deadline",
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
