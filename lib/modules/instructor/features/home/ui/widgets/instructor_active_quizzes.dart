import 'package:flutter/material.dart';

import 'active_quiz_card.dart';

class InstructorActiveQuizzes extends StatelessWidget {
  const InstructorActiveQuizzes({super.key});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          ActiveQuizCard(
            title: 'Aviation Safety Basics',
            questionsCount: 20,
            deadline: 'Dec 28, 2025',
            onTap: () {},
          ),
          ActiveQuizCard(
            title: 'Navigation Quiz',
            questionsCount: 15,
            deadline: 'Dec 30, 2025',
            onTap: () {},
          ),
          ActiveQuizCard(
            title: 'Meteorology Quiz',
            questionsCount: 25,
            deadline: 'Jan 2, 2026',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
