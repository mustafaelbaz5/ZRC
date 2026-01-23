import 'package:flutter/material.dart';

import 'statistics_card.dart';

class InstructorStatisticsGrid extends StatelessWidget {
  const InstructorStatisticsGrid({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.55,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        children: const [
          StatisticsCard(
            icon: Icons.book_rounded,
            title: 'Courses',
            value: '12',
            color: Color(0xFF2196F3),
          ),
          StatisticsCard(
            icon: Icons.edit_note_rounded,
            title: 'Quizzes',
            value: '3',
            color: Color(0xFFFF9800),
          ),
          StatisticsCard(
            icon: Icons.people_rounded,
            title: 'Avg Score',
            value: '860',
            color: Color(0xFF4CAF50),
          ),
          StatisticsCard(
            icon: Icons.visibility_rounded,
            title: 'Total Views',
            value: '34.2K',
            color: Color(0xFF9C27B0),
          ),
        ],
      ),
    );
  }
}
