import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'instructor_stat.dart';

class InstructorCard extends StatelessWidget {
  const InstructorCard({
    super.key,
    required this.name,
    required this.title,
    required this.bio,
    required this.imageUrl,
    required this.rating,
    required this.courses,
    required this.students,
  });

  final String name;
  final String title;
  final String bio;
  final String imageUrl;
  final double rating;
  final int courses;
  final int students;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bio,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InstructorStat(
                icon: Icons.star,
                value: rating.toString(),
                label: tr('student_courses.instructor_card.rating'),
              ),
              InstructorStat(
                icon: Icons.school,
                value: courses.toString(),
                label: tr('student_courses.instructor_card.courses'),
              ),
              InstructorStat(
                icon: Icons.people,
                value: _formatNumber(students),
                label: tr('student_courses.instructor_card.students'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatNumber(final int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
}
